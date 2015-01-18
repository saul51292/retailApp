//
//  FirstViewController.swift
//  retailApp
//
//  Created by Saul on 1/12/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITabBarControllerDelegate {
   
    @IBOutlet var containerView: UIView!
    
   
    let styleManager = StyleManager()
    let backColor = UIColor.flatWhiteColor()
    
    var tabBarBack = UIImage (named: "empty.png")
    var accentColor = UIColor.flatMintColor()
    var darkAccentColor = UIColor.flatMintColorDark()
    
    var buttonRightClicked = false
    var buttonLeftClicked = false
    var tabBar : TabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar = self.childViewControllers[0] as TabBarController
       

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.title = tabBar.text
       //navigationBar.topItem.title = "some title"
        darkAccentColor = tabBar.darkAccentColor
        accentColor = tabBar.accentColor
        styleManager.navBarStyling(self, darkColor:darkAccentColor, emptyImage:tabBarBack!)
        styleManager.tabBarStyling(tabBar, emptyImage:tabBarBack!,lightColor:accentColor)

    }
    
    func animateNumber(label:UILabel, transition:NSString!){
        let animation = CATransition()
        animation.duration = 0.5
        animation.type = kCATransitionMoveIn;
        animation.subtype = transition //You can change this to kCATransitionFromBottom, kCATransitionFromLeft, or kCATransitionFromRight
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        label.layer.addAnimation(animation, forKey: "changeTextTransition")
    }
}

