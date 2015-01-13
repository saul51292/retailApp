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
    
    func graphStyling(simpleGraph:BEMSimpleLineGraphView, lightColor:UIColor, darkColor:UIColor) {
        simpleGraph.colorLine = lightColor
        simpleGraph.colorPoint = darkColor
        simpleGraph.colorYaxisLabel = backColor
        simpleGraph.reloadGraph()
        simpleGraph.colorXaxisLabel = darkColor
        simpleGraph.labelFont = UIFont(name: "Montserrat", size: 13)
        simpleGraph.colorTop = backColor
        simpleGraph.colorBottom = backColor
        simpleGraph.backgroundColor = backColor
        
    }

    
    func navBarStyling(vc:UIViewController, lightColor:UIColor, emptyImage:UIImage) {
        
        var nav = vc.navigationController?.navigationBar
        nav?.barTintColor = lightColor
        
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
    
    
   
    
    func userPicStyling(image:UIImageView,lightColor:UIColor){
        image.layer.cornerRadius = 25
        image.layer.borderColor = lightColor.CGColor
        image.layer.borderWidth = 2
    }
    
    func tabBarStyling(vc:UIViewController, emptyImage:UIImage,lightColor:UIColor)
    {
        
        vc.tabBarController?.tabBar.shadowImage = emptyImage
        vc.tabBarController?.tabBar.backgroundImage = emptyImage
        vc.tabBarController?.tabBar.backgroundColor = backColor
        vc.tabBarController?.tabBar.tintColor = lightColor
    }

    func addGraph(simpleGraph:BEMSimpleLineGraphView)
    {
        
        simpleGraph.enablePopUpReport = true
        simpleGraph.enableYAxisLabel = true
        simpleGraph.enableReferenceXAxisLines = true
        simpleGraph.enableReferenceYAxisLines = true
        simpleGraph.enableBezierCurve = true
    }




}