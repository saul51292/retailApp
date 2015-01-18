//
//  FirstViewController.swift
//  retailApp
//
//  Created by Saul on 1/12/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITabBarControllerDelegate {
    @IBOutlet var salesView: UIView!
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var bttnMiddle: UIButton!
   
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
        //animateButtonAndLabel(bttnMiddle,transition:kCATransitionFromBottom)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        bttnMiddle.setTitle(tabBar.text, forState: .Normal)

        darkAccentColor = tabBar.darkAccentColor
        accentColor = tabBar.accentColor
        styleManager.navBarStyling(self, darkColor:darkAccentColor, emptyImage:tabBarBack!)
        styleManager.tabBarStyling(self, emptyImage:tabBarBack!,lightColor:accentColor)
        salesView.backgroundColor = accentColor

    }
    
    func animateNumber(label:UILabel, transition:NSString!){
        let animation = CATransition()
        animation.duration = 0.5
        animation.type = kCATransitionMoveIn;
        animation.subtype = transition //You can change this to kCATransitionFromBottom, kCATransitionFromLeft, or kCATransitionFromRight
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        label.layer.addAnimation(animation, forKey: "changeTextTransition")
    }
    
//    func switchLabelAndButton(formerButton:UIButton,newButton:UIButton,tabBarIndex:Int){
//        //stylingColor(tabBarIndex,formerButton:formerButton,newButton:newButton)
//        animateButtonAndLabel(formerButton,transition:kCATransitionFromTop)
//        animateButtonAndLabel(newButton,transition:kCATransitionFromBottom)
//        }
//    
//
//    func animateButtonAndLabel(button:UIButton,transition:NSString) {
//        animateNumber(button.titleLabel!, transition: transition)
//    }
}

