//
//  OrderCell.swift
//  retailApp
//
//  Created by alex livenson on 1/18/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class OrderCell: MGSwipeTableCell, MGSwipeTableCellDelegate {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var purchaseTime: UILabel!
    @IBOutlet weak var statusBttn: UIButton!
    

    private var order: Order!
    private let styleManager = StyleManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        styleCell()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCellColorTheme(color: UIColor!) {
        backgroundColor = UIColor.flatWhiteColor()
        purchaseTime.textColor = color
        userName.textColor = color
        userImage!.layer.borderColor = color.CGColor
    }
    
    func setOrder(order: Order) {
        self.order = order
        userName.text = order.name
        purchaseTime.text = order.time
        userImage.image = UIImage(named: order.name)
        changeStatusButtonForOrderStatus()
    }
    
    func completeOrder() {
        order.completeOrder()
    }
    
    // TODO:
    @IBAction func tappedStatusBttn(sender: UIButton) {
        println("Stats button tapped")
    }
    
       
    func createRightButtons()->[AnyObject] {
        self.rightButtons = [MGSwipeButton(title: "right", backgroundColor: UIColor.flatWatermelonColorDark()),MGSwipeButton(title: "right2", backgroundColor: UIColor.flatTealColorDark())]
        return self.rightButtons
    }
    
    func createLeftButtons()->[AnyObject] {
        self.leftButtons = [MGSwipeButton(title: "", icon: UIImage(named: "check"), backgroundColor: UIColor.flatSkyBlueColor())]
        return self.leftButtons
    }
    
    // Probably should move this to a seperate button class
    private func changeStatusButton(title:String,color:UIColor) {
        statusBttn.setTitle(title, forState: .Normal)
        statusBttn.titleLabel?.adjustsFontSizeToFitWidth = true
        statusBttn.backgroundColor = color
    }
    
    private func styleCell() {
        statusBttn.layer.cornerRadius = 4
        backgroundColor = UIColor.flatWhiteColor()
        purchaseTime.textColor = styleManager.darkAccentColor
        userName.textColor = styleManager.darkAccentColor
        
        userPicStyling()
    }
    
    private func userPicStyling(){
        userImage.layer.cornerRadius = 25
        userImage.layer.borderWidth = 2
        userImage!.clipsToBounds = true
    }
    
    private func changeStatusButtonForOrderStatus() {
        // TODO: I still feel that State pattern could be useful here
        switch(order.orderStatus) {
        case .Processing:
            changeStatusButton("Processing", color: UIColor.flatSkyBlueColor())
        case .Cancelled:
            changeStatusButton("Cancelled", color: UIColor.flatRedColor())
        case .Fufilled:
            changeStatusButton("Fufilled", color: UIColor.flatSkyBlueColor())
        }
    }
}

