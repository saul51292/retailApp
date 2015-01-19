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
    
    func navBarStyling(vc:UIViewController, darkColor:UIColor, emptyImage:UIImage) {
        var nav = vc.navigationController?.navigationBar
        nav?.barTintColor = darkColor
        nav?.shadowImage = emptyImage
        nav?.translucent = false
        nav?.setBackgroundImage(emptyImage, forBarMetrics: UIBarMetrics.Default)
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Montserrat", size: 18)!]
        nav?.tintColor = UIColor.whiteColor()
        var moneyBarItem = UIBarButtonItem(title: "$123", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        vc.navigationItem.leftBarButtonItem = moneyBarItem
        var logOutItem = UIBarButtonItem(title: "Log Out", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        vc.navigationItem.rightBarButtonItem = logOutItem
        vc.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Montserrat", size: 16)!], forState: UIControlState.Normal)
        vc.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Montserrat", size: 16)!], forState: UIControlState.Normal)
    }

    
    func tabBarStyling(tabBar:TabBarController, emptyImage:UIImage,lightColor:UIColor) {
        tabBar.tabBar.shadowImage = emptyImage
        tabBar.tabBar.backgroundImage = emptyImage
        tabBar.tabBar.backgroundColor = UIColor.flatBlackColor()
        tabBar.tabBar.tintColor = lightColor
    }

}