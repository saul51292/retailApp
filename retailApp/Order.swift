//
//  Order.swift
//  retailApp
//
//  Created by alex livenson on 1/18/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

struct Order {
    let item: String
//    var orderImage: String
    let orderState: OrderState
    let time: String
    
    init(item: String, orderState: OrderState, time: String) {
        self.item = item
        self.orderState = orderState
        self.time = time
    }
}

protocol OrderState {
    func getName() -> String
}

struct ProcessingState: OrderState {
    func getName() -> String {
        return "Processing"
    }
}

struct CancelledState: OrderState {
    func getName() -> String {
        return "Cancelled"
    }
}

struct FufilledState: OrderState {
    func getName() -> String {
        return "Fufilled"
    }
}