//
//  StyleManager.swift
//  retailApp
//
//  Created by Saul on 1/12/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import Foundation
import UIKit

class StyleManager: NSObject {
    
    let backColor = UIColor.flatWhiteColor()
    let darkAccentColor = UIColor.flatMintColorDark()
    
    func navBarStyling(vc:UIViewController, emptyImage:UIImage,leftItem:UIBarButtonItem,rightItem:UIBarButtonItem) {
        var nav = vc.navigationController?.navigationBar
        nav?.shadowImage = emptyImage
        nav?.translucent = false
        nav?.setBackgroundImage(emptyImage, forBarMetrics: UIBarMetrics.Default)
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Montserrat", size: 18)!]
        nav?.tintColor = UIColor.whiteColor()
               vc.navigationItem.leftBarButtonItem = leftItem
        vc.navigationItem.rightBarButtonItem = rightItem
        vc.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Montserrat", size: 16)!], forState: UIControlState.Normal)
        vc.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Montserrat", size: 16)!], forState: UIControlState.Normal)
    }

    
    func tabBarStyling(tabBar:TabBarController, emptyImage:UIImage,lightColor:UIColor) {
        tabBar.tabBar.shadowImage = emptyImage
        tabBar.tabBar.backgroundImage = emptyImage
        tabBar.tabBar.backgroundColor = UIColor.flatBlackColor()
        tabBar.tabBar.tintColor = lightColor
    }
    
    func styleTagText(textField:UITextField)
    {
        textField.layer.cornerRadius = 4
        textField.backgroundColor = UIColor.flatGrayColorDark().colorWithAlphaComponent(0.8)
        textField.textAlignment = .Center
        textField.textColor = UIColor.whiteColor()
        textField.font = UIFont(name: "Montserrat", size: 16)
        
    }
    
    func styleTagButton(button:UIButton,text:String)
    {
        button.backgroundColor = UIColor.flatSkyBlueColor()
        button.setTitle(text, forState: .Normal)
        button.titleLabel?.textColor = UIColor.whiteColor()
        button.titleLabel?.font = UIFont(name: "Montserrat", size: 14)
        
    }
    

}