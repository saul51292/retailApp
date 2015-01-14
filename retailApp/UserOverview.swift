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
        // 1. setup any properties here

        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    func xibSetup() {
        
        contentView = loadViewFromNib()
        // use bounds not frame or it'll be offset
        contentView.frame = bounds
        
        // Make the view stretch with containing view
        contentView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView)
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
