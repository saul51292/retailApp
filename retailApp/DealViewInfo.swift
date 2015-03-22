//
//  DealViewInfo.swift
//  Checkit
//
//  Created by alex livenson on 11/18/14.
//  Copyright (c) 2014 Alex Livenson. All rights reserved.
//

import UIKit

class DealViewInfo: UIView,UITextFieldDelegate {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet var priceField: UITextField!
    
    @IBOutlet var priceView: UIView!
    
    @IBOutlet var dealField: UITextField!
    
    // Responsible for anarchiving the view (nib file) -> associate this class with the nib
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {    //delegate method
        
        priceField.font = UIFont(name: "Montserrat", size: 30.0)
        if priceField.text.rangeOfString("$") == nil{
             priceField.text = "$".stringByAppendingString(priceField.text)
        }
       


    }
    
    func setUpPlaceholder(textField:UITextField,size:CGFloat,string:String,color:UIColor)
    {
        let attriString = NSAttributedString(string:string, attributes:
            [NSForegroundColorAttributeName: color,
                NSFontAttributeName: UIFont(name: "Montserrat", size: size)!])
        textField.attributedPlaceholder = attriString
        
    }
    
    private func xibSetup() {
        contentView = loadViewFromNib("DealViewInfo")
        contentView.frame = bounds
        setUpPlaceholder(priceField,size:15,string:"Set Price",color:UIColor.lightGrayColor())
        setUpPlaceholder(dealField,size:23,string:"Enter Deal Name",color:UIColor.darkGrayColor())
        priceField.layer.borderColor = UIColor.whiteColor().CGColor
        priceField.layer.borderWidth = 2
        priceField.layer.cornerRadius = 39
        priceField.delegate = self
        addSubview(contentView)
            }

}
