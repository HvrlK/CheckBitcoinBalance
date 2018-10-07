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
    
    //MARK: - Properties
    
    var viewModel = CheckBitcoinBalanceViewModel()
    
    var disposeBag = DisposeBag()
    
    //MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

