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
    let tapRec = UITapGestureRecognizer()
    
    var count = 30
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
        lblTime.text = String(count)
        tapRec.addTarget(self, action: "tappedView")
        contentView.addGestureRecognizer(tapRec)

        addSubview(contentView)
    }

    
    func tappedView(){
        count += 15
        lblTime.text = String(count)
        if(count > 60){
            count = 30
            lblTime.text = String(count)
        }
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