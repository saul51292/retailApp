//
//  cashOutView.swift
//  retailApp
//
//  Created by Saul on 1/29/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class cashOutView: UIView {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var topView: UIView!
    @IBOutlet var variableButtonView: UIView!
    
    @IBOutlet var lblTheBank: UILabel!
    @IBOutlet var lblTotalBank: UILabel!
    @IBOutlet var lblYouHave: UILabel!
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    
    func xibSetup() {
        contentView = loadViewFromNib("cashOutView") as UIView
        contentView.frame = bounds
        contentView.layer.cornerRadius = 6
        mainView.layer.cornerRadius = 6
        addSubview(contentView)
    }

    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
