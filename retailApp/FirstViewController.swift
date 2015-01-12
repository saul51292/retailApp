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
    
    
    @IBOutlet var bttnRight: UIButton!
    @IBOutlet var bttnMiddle: UIButton!
    @IBOutlet var bttnLeft: UIButton!
    
    @IBOutlet var lblMiddle: UILabel!
    @IBOutlet var lblLeft: UILabel!
    @IBOutlet var lblRight: UILabel!
    
    
    var screenSize = UIScreen.mainScreen().bounds
    var tabBarBack = UIImage (named: "empty.png")
    let backColor = UIColor.flatWhiteColor()
    var accentColor = UIColor.flatTealColor()
    var darkAccentColor = UIColor.flatTealColorDark()
    
    var buttonRightClicked = false
    var buttonLeftClicked = false
    
    
     let data = [1,5,3,4,5,6,7,6,5,7,4,5,6,8,7,6,5]
    let data2 = ["1:00","1:15","1:30","1:45","2:00","2:15","2:30","2:45","3:00","3:15","3:30","3:45","4:00","4:15","4:30","4:45","5:00" ]

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addGraph()
        var timer = NSTimer.scheduledTimerWithTimeInterval(7, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navBarStyling()
        tabBarStyling()
        graphStyling()
        salesView.backgroundColor = darkAccentColor
        
        }
    
    
    func switchLabelAndButton(formerLabel:UILabel,formerButton:UIButton,newLabel:UILabel,newButton:UIButton){
        var oldLabel = formerLabel.text
        formerButton.setTitle(newButton.titleLabel?.text, forState: .Normal)
        formerLabel.text = newLabel.text
        newButton.setTitle(formerButton.titleLabel?.text, forState: .Normal)
        newLabel.text = oldLabel
        println(formerLabel.text)
        stylingColor(formerLabel.text!)

        
    }
    
   func backToMiddle() {
        
        darkAccentColor = UIColor.flatTealColorDark()
        accentColor = UIColor.flatTealColor()
        
        switchLabelAndButton(lblMiddle,formerButton:bttnMiddle,newLabel:lblRight,newButton:bttnRight)

        viewWillAppear(true)
    }
    
    @IBAction func bttnLeftClicked(sender: AnyObject) {
    
        
        switchLabelAndButton(lblMiddle,formerButton:bttnMiddle,newLabel:lblLeft,newButton:bttnLeft)

        viewWillAppear(true)
    }
    
    
    func stylingColor(formerLabel:String)
    {
        let labelStyling = formerLabel
        
        switch labelStyling {
            
        case "Pending":
            darkAccentColor = UIColor.flatSkyBlueColorDark()
            accentColor = UIColor.flatSkyBlueColor()
        case "Fufilled":
            darkAccentColor = UIColor.flatWatermelonColorDark()
            accentColor = UIColor.flatWatermelonColor()
        default:
            darkAccentColor = UIColor.flatTealColorDark()
            accentColor = UIColor.flatTealColor()
            }
        }
    
    
    @IBAction func bttnRightClicked(sender: AnyObject) {
    
        switchLabelAndButton(lblMiddle,formerButton:bttnMiddle,newLabel:lblRight,newButton:bttnRight)
            
            viewWillAppear(true)
    }
    
    
    func lineGraph(graph: BEMSimpleLineGraphView!, labelOnXAxisForIndex index: Int) -> String! {
        if ((index % 2) == 1){
            return data2[index]
        }
        return ""
    }
    
     func numberOfGapsBetweenLabelsOnLineGraph(graph: BEMSimpleLineGraphView!) -> Int {
        return 1
    }
    
    
    
    func navBarStyling() {
        var nav = self.navigationController?.navigationBar
        salesView.backgroundColor = darkAccentColor
        nav?.barTintColor = accentColor
        
        nav?.shadowImage = tabBarBack
       nav?.translucent = false
        nav?.setBackgroundImage(tabBarBack, forBarMetrics: UIBarMetrics.Default)

        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Montserrat", size: 18)!]
        nav?.tintColor = UIColor.whiteColor()
        
        var moneyBarItem = UIBarButtonItem(title: "$123", style: UIBarButtonItemStyle.Plain, target: self, action: "buttonMethod")
        
                navigationItem.leftBarButtonItem = moneyBarItem
        
        var logOutItem = UIBarButtonItem(title: "Log Out", style: UIBarButtonItemStyle.Plain, target: self, action: "buttonMethod")
        navigationItem.rightBarButtonItem = logOutItem

        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Montserrat", size: 16)!], forState: UIControlState.Normal)
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Montserrat", size: 16)!], forState: UIControlState.Normal)

        

    }
    
    func tabBarStyling()
    {
        
        self.tabBarController?.tabBar.shadowImage = tabBarBack
        self.tabBarController?.tabBar.backgroundImage = tabBarBack
        self.tabBarController?.tabBar.backgroundColor = backColor
        self.tabBarController?.tabBar.tintColor = accentColor
    }
    
    
    
    func lineGraph(graph: BEMSimpleLineGraphView!, valueForPointAtIndex index: Int) -> CGFloat {
       
        return CGFloat(data[index])
    }
    
    func numberOfPointsInLineGraph(graph: BEMSimpleLineGraphView!) -> Int {
        return data.count
    }
    
    func graphStyling() {
        simpleGraph.colorLine = accentColor
        simpleGraph.colorPoint = darkAccentColor
        simpleGraph.colorYaxisLabel = backColor
        update()
    }
  
    
    func addGraph()
    {
        simpleGraph.colorTop = backColor
        simpleGraph.colorBottom = backColor
        simpleGraph.backgroundColor = backColor
        simpleGraph.enablePopUpReport = true
        simpleGraph.enableYAxisLabel = true
        simpleGraph.enableReferenceXAxisLines = true
        simpleGraph.enableReferenceYAxisLines = true
        simpleGraph.enableBezierCurve = true
    }
    
    func update() {
        simpleGraph.reloadGraph()
    }
    
    func buttonMethod() {
        println("Yo")
    }
     
}

