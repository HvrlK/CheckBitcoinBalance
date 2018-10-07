//
//  CheckBitcoinBalance.swift
//  CheckBitcoinBalance
//
//  Created by Vitalii Havryliuk on 10/7/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import SwiftyJSON

class CheckBitcoinBalanceViewModel {
    
    //MARK: - Properties
    
    var addressString = BehaviorRelay<String>(value: "")
    var isValid = BehaviorRelay<Bool>(value: false)
    var bitcoin = BehaviorRelay<Bitcoin?>(value: nil)
    var disposeBag = DisposeBag()
    
    //MARK: - Methods
    
    init() {
        _ = isValid.asObservable().filter({ (isValid) -> Bool in
            return isValid
        })
            .subscribe { _ in
                self.fetchBitcoin { (bitcoin) in
                    self.bitcoin.accept(bitcoin)
                }
            }
            .disposed(by: disposeBag)
    }
    
    func validBitcoinAddress() {
        let regularExpression = "^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$"
        let addressTest = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        self.isValid.accept(addressTest.evaluate(with: addressString.value))
    }
    
    func fetchBitcoin(completion: @escaping (Bitcoin?) -> Void) {
        Alamofire.request("https://blockexplorer.com/api/addr/\(addressString.value)")
            .responseJSON { response in
                guard response.result.isSuccess, let value = response.result.value else {
                    print("Error while fetching: \(String(describing: response.result.error))")
                    completion(nil)
                    return
                }
                let bitcoin = Bitcoin(json: JSON(value))
                guard bitcoin.address != "" else {
                    completion(nil)
                    return
                }
                completion(bitcoin)
        }
    }
    
}
