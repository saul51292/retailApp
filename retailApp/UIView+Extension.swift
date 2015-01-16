//
//  UIView+Extension.swift
//  retailApp
//
//  Created by alex livenson on 1/15/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

extension UIView {
    func loadViewFromNib(nibName: String) -> UIView {
    let bundle = NSBundle(forClass: self.dynamicType)
    let nib = UINib(nibName: nibName, bundle: bundle)
    
    // Assumes UIView is top level and only object in CustomView.xib file
    let view = nib.instantiateWithOwner(self, options: nil)[0] as UIView
    return view
    }
}
