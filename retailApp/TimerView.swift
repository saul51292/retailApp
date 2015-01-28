//
//  TimerView.swift
//  Checkit
//
//  Created by Saul on 12/25/14.
//  Copyright (c) 2014 Alex Livenson. All rights reserved.
//

import UIKit

class TimerView: UIView {
    
    @IBOutlet var bttnTimer: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet var lblTime: UILabel!
    
    var count = 30
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       xibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    @IBAction func bttnTimerClicked(sender: AnyObject) {
        count += 15
        lblTime.text = String(count)
        if(count > 60){
            count = 30
            lblTime.text = String(count)
        }

    }
    
    func xibSetup() {
        contentView = loadViewFromNib("TimerView")
        lblTime.text = String(count)
        addSubview(contentView)
    }
    
    override func layoutSubviews() {
        lblTime.layer.masksToBounds = true
        lblTime.layer.cornerRadius = 25
        bttnTimer.layer.masksToBounds = true
        bttnTimer.layer.cornerRadius = 25
        contentView.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.45)
        contentView.layer.borderColor = UIColor.whiteColor().CGColor
        contentView.layer.borderWidth = 2
        contentView.addSubview(lblTime)
    }
    
}