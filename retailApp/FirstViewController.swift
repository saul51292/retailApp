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
    var tabBarColor = UIColor(red: (244/255.0), green: (244/255.0), blue: (244/255.0), alpha: 1.0)


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
        
        
        
    
    }
    
    
    func navBarStyling() {
        var nav = self.navigationController?.navigationBar
        nav?.barTintColor = salesView.backgroundColor
        nav?.shadowImage = tabBarBack
       nav?.translucent = false
        nav?.setBackgroundImage(tabBarBack, forBarMetrics: UIBarMetrics.Default)

        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        nav?.tintColor = UIColor.whiteColor()
        
        var moneyBarItem = UIBarButtonItem(title: "$123", style: UIBarButtonItemStyle.Plain, target: self, action: "buttonMethod")
        
        navigationItem.leftBarButtonItem = moneyBarItem
        
        var logOutItem = UIBarButtonItem(title: "Log Out", style: UIBarButtonItemStyle.Plain, target: self, action: "buttonMethod")
        navigationItem.rightBarButtonItem = logOutItem

    }
    
    func tabBarStyling()
    {
        
        self.tabBarController?.tabBar.shadowImage = tabBarBack
        self.tabBarController?.tabBar.backgroundImage = tabBarBack
        self.tabBarController?.tabBar.backgroundColor = tabBarColor
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

