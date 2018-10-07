//
//  Bitcoin.swift
//  CheckBitcoinBalance
//
//  Created by Vitalii Havryliuk on 10/7/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Bitcoin {
    
    var address: String
    var balance: Double
    
    init(json: JSON) {
        self.address = json["addrStr"].stringValue
        self.balance = json["balance"].doubleValue
    }
    
}
