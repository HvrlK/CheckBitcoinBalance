//
//  CheckBitcoinBalance.swift
//  CheckBitcoinBalance
//
//  Created by Vitalii Havryliuk on 10/7/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import Foundation
import RxSwift

class CheckBitcoinBalanceViewModel {
    
    //MARK: - Properties
    
    var addressString = Variable<String>("")
    
    //MARK: - Methods
    
    func isValidBitcoinAddress() -> Bool {
        let regularExpression = "^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$"
        let addressTest = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return addressTest.evaluate(with: addressString.value)
    }
    
}
