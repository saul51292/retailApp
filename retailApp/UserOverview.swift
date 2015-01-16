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

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        println("touches began")

        var touch = touches.anyObject() as UITouch
        if !touch.view .isKindOfClass(UserOverview) {
            self.removeFromSuperview()
        }
    }
    

    func xibSetup() {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        self.contentView.layer.cornerRadius = 6
        self.variableButtonView.layer.cornerRadius = 6
        addSubview(contentView)
    }
    
    
    func styleShowUser(view:UIView) {
        self.styleUserPicture()
        self.styleUserContentView()
        view.addSubview(self)
        
    }
    

    func styleUserContentView() {
        self.backgroundColor = UIColor.flatGrayColor().colorWithAlphaComponent(0.9)
        self.layer.cornerRadius = 6
    }
    
    
    func styleUserPicture(){
        userPicture.layer.cornerRadius = 6
        userPicture.bounds = contentView.bounds
        userPicture.layer.borderColor = UIColor.whiteColor().CGColor
        userPicture.clipsToBounds = true
    }

    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "UserOverview", bundle: bundle)
        
        // Assumes UIView is top level and only object in CustomView.xib file
        let view = nib.instantiateWithOwner(self, options: nil)[0] as UIView
        return view
    }

    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
