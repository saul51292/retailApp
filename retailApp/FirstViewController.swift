//
//  FirstViewController.swift
//  retailApp
//
//  Created by Saul on 1/12/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,BEMSimpleLineGraphDataSource,BEMSimpleLineGraphDelegate {
    
    @IBOutlet var simpleGraph: BEMSimpleLineGraphView!
    @IBOutlet var salesView: UIView!
    
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var bttnRight: UIButton!
    @IBOutlet var bttnMiddle: UIButton!
    @IBOutlet var bttnLeft: UIButton!
    
    @IBOutlet var lblMiddle: UILabel!
    @IBOutlet var lblLeft: UILabel!
    @IBOutlet var lblRight: UILabel!
    
    var screenSize = UIScreen.mainScreen().bounds
    var tabBarBack = UIImage (named: "empty.png")
    let styleManager = StyleManager()
    let backColor = UIColor.flatWhiteColor()
    var accentColor = UIColor.flatMintColor()
    var darkAccentColor = UIColor.flatMintColorDark()
    
    var buttonRightClicked = false
    var buttonLeftClicked = false
    var tabBar : TabBarController!
    
    let data = [1, 5, 3, 4, 5, 6, 7, 6, 5, 7, 4, 5, 6, 8, 7, 6, 5]
    let data2 = ["1:00", "1:15", "1:30", "1:45", "2:00", "2:15", "2:30", "2:45", "3:00", "3:15", "3:30", "3:45", "4:00", "4:15", "4:30", "4:45", "5:00" ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar = self.childViewControllers[0] as TabBarController
        
        // Do any additional setup after loading the view, typically from a nib.
        containerView.hidden = true
        animateButtonAndLabel(bttnMiddle,label:lblMiddle,transition:kCATransitionFromBottom)
        animateButtonAndLabel(bttnRight,label:lblRight,transition:kCATransitionFromRight)
        animateButtonAndLabel(bttnLeft,label:lblLeft,transition:kCATransitionFromLeft)
        styleManager.addGraph(simpleGraph)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        sendColor()
        tabBar.reloadTable()
        styleManager.navBarStyling(self, darkColor:darkAccentColor, emptyImage:tabBarBack!)
        styleManager.tabBarStyling(self, emptyImage:tabBarBack!,lightColor:accentColor)
        styleManager.graphStyling(simpleGraph, lightColor:accentColor, darkColor:darkAccentColor)
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
    
    func lineGraph(graph: BEMSimpleLineGraphView!, labelOnXAxisForIndex index: Int) -> String! {
        if (index % 2) == 1 {
            return data2[index]
        }
        return ""
    }
    
    func numberOfGapsBetweenLabelsOnLineGraph(graph: BEMSimpleLineGraphView!) -> Int {
        return 1
    }
    
    
    func lineGraph(graph: BEMSimpleLineGraphView!, valueForPointAtIndex index: Int) -> CGFloat {
        return CGFloat(data[index])
    }
    
    func numberOfPointsInLineGraph(graph: BEMSimpleLineGraphView!) -> Int {
        return data.count
    }
    
}

