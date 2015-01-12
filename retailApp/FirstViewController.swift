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
    var screenSize = UIScreen.mainScreen().bounds
    var tabBarBack = UIImage (named: "empty.png")
     let data = [1,5,3,4,5,6,7,6,5,4,7,5,7,8,9,7,5,6,7,8,9,4,6,4]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addGraph()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navBarStyling()
        tabBarStyling()
        salesView.backgroundColor = UIColor.flatTealColorDark()
        
        
    
    }
    
    
    func navBarStyling() {
        var nav = self.navigationController?.navigationBar
        
        nav?.barTintColor = UIColor.flatTealColor()
        
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
        self.tabBarController?.tabBar.backgroundColor = UIColor.flatWhiteColor()
        self.tabBarController?.tabBar.tintColor = salesView.backgroundColor
    }
    
    
    func lineGraph(graph: BEMSimpleLineGraphView!, valueForPointAtIndex index: Int) -> CGFloat {
       
        return CGFloat(data[index])
    }
    
    func numberOfPointsInLineGraph(graph: BEMSimpleLineGraphView!) -> Int {
        return data.count
    }
    
    func addGraph()
    {
        simpleGraph.colorTop = UIColor.flatWhiteColor()
        simpleGraph.colorBottom = UIColor.flatWhiteColor()
       simpleGraph.backgroundColor = UIColor.flatWhiteColor()
        simpleGraph.colorLine = UIColor.flatTealColor()
        simpleGraph.colorPoint = UIColor.flatTealColorDark()
        simpleGraph.colorYaxisLabel =  UIColor.flatTealColorDark()
        simpleGraph.enablePopUpReport = true
        simpleGraph.enableYAxisLabel = true
        simpleGraph.enableReferenceXAxisLines = true
        simpleGraph.enableReferenceYAxisLines = true
        simpleGraph.enableBezierCurve = true
        self.view.addSubview(simpleGraph)
    }
    
    func buttonMethod() {
        println("Yo")
    }
     
}

