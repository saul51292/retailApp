//
//  ExampleData.swift
//  retailApp
//
//  Created by alex livenson on 1/18/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

// TODO Use this as the fake data source
private let bus = "Bus"
private let helicopter = "Helicopter"
private let truck = "Truck"
private let boat = "Boat"
private let bicycle = "Bicycle"
private let motorcycle = "Motorcycle"
private let plane = "Plane"
private let train = "Train"
private let car = "Car"
private let scooter = "Scooter"
private let caravan = "Caravan"

private let t1 = "1:00"
private let t2 = "1:15"
private let t3 = "1:30"
private let t4 = "1:45"
private let t5 = "2:00"
private let t6 = "2:15"
private let t7 = "2:30"
private let t8 = "2:45"
private let t9 = "3:00"
private let t10 = "3:15"
private let t11 = "3:30"


private let d1 = Order(name: bus, orderStatus: OrderStatus.Processing, time: t1)
private let d2 = Order(name: helicopter, orderStatus: OrderStatus.Cancelled, time: t2)
private let d3 = Order(name: truck, orderStatus: OrderStatus.Processing, time: t3)
private let d4 = Order(name: boat, orderStatus: OrderStatus.Cancelled, time: t4)
private let d5 = Order(name: bicycle, orderStatus: OrderStatus.Processing, time: t5)
private let d6 = Order(name: motorcycle, orderStatus: OrderStatus.Cancelled, time: t6)
private let d7 = Order(name: plane, orderStatus: OrderStatus.Processing, time: t7)
private let d8 = Order(name: train, orderStatus: OrderStatus.Cancelled, time: t8)
private let d9 = Order(name: car, orderStatus: OrderStatus.Processing, time: t9)
private let d10 = Order(name: bus, orderStatus: OrderStatus.Fufilled, time: t1)
private let d11 = Order(name: helicopter, orderStatus: OrderStatus.Fufilled, time: t2)
private let d12 = Order(name: truck, orderStatus: OrderStatus.Fufilled, time: t3)
private let d13 = Order(name: boat, orderStatus: OrderStatus.Fufilled, time: t4)
private let d14 = Order(name: bicycle, orderStatus: OrderStatus.Fufilled, time: t5)
private let d15 = Order(name: motorcycle, orderStatus: OrderStatus.Fufilled, time: t6)

let dataArr: Array<Order> = [d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15]

