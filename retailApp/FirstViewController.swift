//
//  FirstViewController.swift
//  retailApp
//
//  Created by Saul on 1/12/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet var salesView: UIView!
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var bttnRight: UIButton!
    @IBOutlet var bttnMiddle: UIButton!
    @IBOutlet var bttnLeft: UIButton!
    
    @IBOutlet var lblMiddle: UILabel!
    @IBOutlet var lblLeft: UILabel!
    @IBOutlet var lblRight: UILabel!
    
    @IBOutlet var progressView: ProgressBar!
    
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
        containerView.hidden = true
        animateButtonAndLabel(bttnMiddle,label:lblMiddle,transition:kCATransitionFromBottom)
        animateButtonAndLabel(bttnRight,label:lblRight,transition:kCATransitionFromRight)
        animateButtonAndLabel(bttnLeft,label:lblLeft,transition:kCATransitionFromLeft)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Progress View Setup
        progressView.timeProgressBar(30,avgTimeToSwipe:27,progressBar:progressView.topProgressBar)
        progressView.maleVsFemaleProgressBar(0.30,percentFemale:0.70,progressBar:progressView.middleProgressBar)
        progressView.seenVsPurchased(1000,numberPurchased:300,progressBar:progressView.bottomProgressBar)
        
        progressView.styleStatView(progressView.topLeftStat, darkColor:UIColor.flatSkyBlueColorDark(),topTitle:"4,332",bottomTitle:"Views")
        progressView.styleStatView(progressView.topRightStat, darkColor:darkAccentColor, topTitle:"125", bottomTitle:"Sales")
        progressView.styleStatView(progressView.bottomLeftStat, darkColor:UIColor.flatOrangeColorDark(), topTitle:"150",bottomTitle:"Shares")
        progressView.styleStatView(progressView.bottomRightStat, darkColor:UIColor.flatPurpleColor(), topTitle:"$32",bottomTitle:"Avg. Price")
        
        sendColor()
        tabBar.reloadTable()
        styleManager.navBarStyling(self, darkColor:darkAccentColor, emptyImage:tabBarBack!)
        styleManager.tabBarStyling(self, emptyImage:tabBarBack!,lightColor:accentColor)
        salesView.backgroundColor = accentColor
    }
    
    @IBAction func bttnLeftClicked(sender: AnyObject) {
        switchLabelAndButton(lblMiddle,formerButton:bttnMiddle,newLabel:lblLeft,newButton:bttnLeft)
        viewWillAppear(true)
    }
    
    func sendColor(){
        tabBar.accentColor = accentColor
        tabBar.darkAccentColor = darkAccentColor
    }
    
    func animateNumber(label:UILabel, transition:NSString!){
        let animation = CATransition()
        animation.duration = 0.5
        animation.type = kCATransitionMoveIn;
        animation.subtype = transition //You can change this to kCATransitionFromBottom, kCATransitionFromLeft, or kCATransitionFromRight
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        label.layer.addAnimation(animation, forKey: "changeTextTransition")
    }
    
    @IBAction func bttnRightClicked(sender: AnyObject) {
        switchLabelAndButton(lblMiddle,formerButton:bttnMiddle,newLabel:lblRight,newButton:bttnRight)
        viewWillAppear(true)
    }
    
    func switchLabelAndButton(formerLabel:UILabel,formerButton:UIButton,newLabel:UILabel,newButton:UIButton){
        var oldLabel = formerLabel.text
        formerButton.setTitle(newButton.titleLabel?.text, forState: .Normal)
        formerLabel.text = newLabel.text
        newButton.setTitle(formerButton.titleLabel?.text, forState: .Normal)
        newLabel.text = oldLabel
        println(formerLabel.text)
        animateButtonAndLabel(formerButton,label:formerLabel,transition:kCATransitionFromTop)
        animateButtonAndLabel(newButton,label:newLabel,transition:kCATransitionFromBottom)
        
        stylingColor(formerLabel.text!)
    }
    
    func animateButtonAndLabel(button:UIButton,label:UILabel,transition:NSString) {
        animateNumber(button.titleLabel!, transition: transition)
        animateNumber(label, transition: transition)
    }
    
    
    func stylingColor(formerLabel:String) {
        let labelStyling = formerLabel
        
        switch labelStyling {
        case "Pending":
            containerView.hidden = false
            tabBar.selectedIndex = 1
            darkAccentColor = UIColor.flatMagentaColorDark()
            accentColor = UIColor.flatMagentaColor()
        case "Fufilled":
            containerView.hidden = false
            tabBar.selectedIndex = 0
            darkAccentColor = UIColor.flatSkyBlueColorDark()
            accentColor = UIColor.flatSkyBlueColor()
        default:
            containerView.hidden = true
            darkAccentColor = UIColor.flatMintColorDark()
            accentColor = UIColor.flatMintColor()
        }
    }
    
}

