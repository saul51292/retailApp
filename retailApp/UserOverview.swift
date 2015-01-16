//
//  UserOverview.swift
//  retailApp
//
//  Created by Saul on 1/14/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class UserOverview: UIView {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var variableButtonView: UIView!
    @IBOutlet var userView: UIView!
    //Static
    
    @IBOutlet var lblStatus: UILabel!
    @IBOutlet var bottomView: UIView!
    @IBOutlet var lblFufilled: UILabel!
    @IBOutlet var lblPaidWith: UILabel!
    
    //Variable
    @IBOutlet var userName: UILabel!
    @IBOutlet var userPicture: UIImageView!
    @IBOutlet var fufilledTime: UILabel!
    @IBOutlet var dealPaymentForm: UILabel!
    @IBOutlet var dealPrice: UILabel!
    @IBOutlet var variableActionButton: UIButton!
    @IBOutlet var productName: UILabel!
    @IBOutlet var variableStatus: UILabel!

    let tapRec = UITapGestureRecognizer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    
    func tappedView(){
        self.removeFromSuperview()

    }
    
    
    func removeshowUser()
    {
       tapRec.addTarget(self, action: "tappedView")
        userView.addGestureRecognizer(tapRec)
        
    }

    func xibSetup() {
        contentView = loadViewFromNib("UserOverview")
        contentView.frame = bounds
    setScrollContentSize()
        removeshowUser()

        addSubview(contentView)

    }
    
    
    func setScrollContentSize()
    {
        var userSize = CGSize(width: userView.frame.width, height: userView.frame.height)
        scrollView.contentSize = userSize
        
    }
    
    
    func colorUserOverview(color:UIColor)
        
    {
        styleUserPicture(color)
        lblFufilled.textColor = color
        lblPaidWith.textColor = color
        variableStatus.textColor = color
        dealPaymentForm.textColor = color
        dealPrice.textColor = color
        fufilledTime.textColor = color
        userName.textColor = color
        productName.textColor = color
        variableButtonView.backgroundColor = color
    }

    func styleUserPicture(color:UIColor){
        userPicture.layer.cornerRadius = 40
        userPicture.layer.borderColor = color.CGColor
        userPicture.layer.borderWidth = 2
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
