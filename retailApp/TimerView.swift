//
//  TimerView.swift
//  Checkit
//
//  Created by Saul on 12/25/14.
//  Copyright (c) 2014 Alex Livenson. All rights reserved.
//

import UIKit

class TimerView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var lblTime: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       xibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    
    func xibSetup() {
        contentView = loadViewFromNib("TimerView")
        addSubview(contentView)
    }

    
    override func layoutSubviews() {
        lblTime.layer.masksToBounds = true
        lblTime.layer.cornerRadius = 25
        contentView.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.45)
        contentView.layer.borderColor = UIColor.whiteColor().CGColor
        contentView.layer.borderWidth = 2
        contentView.addSubview(lblTime)
    }
    
}