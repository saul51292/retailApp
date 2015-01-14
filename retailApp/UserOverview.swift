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
    
    @IBOutlet var userName: UILabel!
    @IBOutlet var userPicture: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        
        contentView = loadViewFromNib()
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    func styleUserOverview(darkColor : UIColor){
        userPicture.layer.cornerRadius = 60
        userPicture.layer.borderWidth = 2
        userPicture.layer.borderColor = darkColor.CGColor
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
