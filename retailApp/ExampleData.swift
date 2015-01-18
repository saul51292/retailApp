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


private let d1 = Order(item: bus, orderState: ProcessingState(), time: t1)
private let d2 = Order(item: helicopter, orderState: CancelledState(), time: t2)
private let d3 = Order(item: truck, orderState: ProcessingState(), time: t3)
private let d4 = Order(item: boat, orderState: CancelledState(), time: t4)
private let d5 = Order(item: bicycle, orderState: ProcessingState(), time: t5)
private let d6 = Order(item: motorcycle, orderState: ProcessingState(), time: t6)
private let d7 = Order(item: plane, orderState: CancelledState(), time: t7)
private let d8 = Order(item: train, orderState: ProcessingState(), time: t8)
private let d9 = Order(item: car, orderState: CancelledState(), time: t9)
private let d10 = Order(item: bus, orderState: FufilledState(), time: t1)
private let d11 = Order(item: helicopter, orderState: FufilledState(), time: t2)
private let d12 = Order(item: truck, orderState: FufilledState(), time: t3)
private let d13 = Order(item: boat, orderState: FufilledState(), time: t4)
private let d14 = Order(item: bicycle, orderState: FufilledState(), time: t5)
private let d15 = Order(item: motorcycle, orderState: FufilledState(), time: t6)

let dataArr = [d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15]

