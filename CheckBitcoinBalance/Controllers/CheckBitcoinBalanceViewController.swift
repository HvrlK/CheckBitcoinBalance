//
//  ViewController.swift
//  CheckBitcoinBalance
//
//  Created by Vitalii Havryliuk on 10/7/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CheckBitcoinBalanceViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var bitcoinAddressTextField: UITextField!
    @IBOutlet weak var checkBalanceButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    
    var viewModel = CheckBitcoinBalanceViewModel()
    var disposeBag = DisposeBag()
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bitcoinAddressTextField.rx.text.orEmpty.bind(to: viewModel.addressString).disposed(by: disposeBag)
        checkBalanceButton.rx.tap.asObservable().filter( { (_) -> Bool in
            return true
        })
            .subscribe { _ in
                if self.viewModel.isValidBitcoinAddress() {
                    self.checkBalance()
                } else {
                    self.showAlert(title: "Invalid Address")
                }
        }
        .disposed(by: disposeBag)
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(dismissAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func switchActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = !self.activityIndicator.isHidden
            
        }
    }
    
}

