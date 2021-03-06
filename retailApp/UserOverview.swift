//
//  UserOverview.swift
//  retailApp
//
//  Created by Saul on 1/14/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class UserOverview: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var variableButtonView: UIView!
    @IBOutlet var userView: UIView!
    @IBOutlet var topView: UIView!
    //Static
    
    @IBOutlet var lblFufilled: UILabel!
    
    //Variable
    @IBOutlet var userName: UILabel!
    @IBOutlet var userPicture: UIImageView!
    @IBOutlet var fufilledTime: UILabel!
    @IBOutlet var dealPrice: UILabel!
    @IBOutlet var variableActionButton: UIButton!
    @IBOutlet var productName: UILabel!
    @IBOutlet var orderNumber: UIButton!
    
    
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    

    func xibSetup() {
        contentView = loadViewFromNib("UserOverview") as UIView
        contentView.frame = bounds
        contentView.layer.cornerRadius = 6
        addSubview(contentView)
    }
    
    
    
    func colorUserOverview(color:UIColor) {
        styleUserPicture(color)
        topView.backgroundColor = color
       dealPrice.textColor = color
        fufilledTime.textColor = color
        userName.textColor = color
        variableButtonView.backgroundColor = color
    }
    
    func styleUserPicture(color:UIColor) {
        userPicture.layer.cornerRadius = 35
        userPicture.layer.borderColor = color.CGColor
        userPicture.layer.borderWidth = 2.5
        userPicture.clipsToBounds = true
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
}
