//
//  Order.swift
//  retailApp
//
//  Created by alex livenson on 1/18/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

enum OrderStatus {
    case Cancelled
    case Processing
    case Fufilled
}

class Order {
    
    let name: String
    var orderStatus: OrderStatus
    let time: String
    
    init(name: String, orderStatus: OrderStatus, time: String) {
        self.name = name
        self.orderStatus = orderStatus
        self.time = time
    }
    
    func completeOrder() {
        orderStatus = OrderStatus.Fufilled
    }
}
