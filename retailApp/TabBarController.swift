//
//  TabBarController.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarDelegate {
    var fufilledTV : FufilledTV!
    var ordersTV : OrdersTV!
    var darkAccentColor = UIColor.flatMagentaColorDark()
    var accentColor = UIColor.flatMagentaColor()
    var progressVC : ProgressVC!    
    let styleManager = StyleManager()
    var tabBarBack = UIImage (named: "empty.png")
    var dealViewInfo = DealViewInfo(frame:(CGRectMake(0,  UIScreen.mainScreen().bounds.height - 150,  UIScreen.mainScreen().bounds.width, 100)))
    var captureButton = UIButton(frame:(CGRectMake (0,UIScreen.mainScreen().bounds.height - 50,UIScreen.mainScreen().bounds.width,50)))

    var timerView  = TimerView(frame: CGRectMake(UIScreen.mainScreen().bounds.width - 70, 30, 50, 50))
    var screenSize =  UIScreen.mainScreen().bounds

    var text = "Orders"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ordersTV = self.childViewControllers[0] as OrdersTV
        fufilledTV = self.childViewControllers[1] as FufilledTV
        progressVC = self.childViewControllers[3] as ProgressVC
        
        text = "\(ordersTV.ordersItems.count) Orders"
        navigationController?.navigationBar.topItem?.title = self.text
        reloadAndStyleTable(ordersTV)
        ordersTV.addBadge()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       
        navigationController?.navigationBar.topItem?.title = text
        styleManager.navBarStyling(self, darkColor:darkAccentColor, emptyImage:tabBarBack!)
        styleManager.tabBarStyling(self, emptyImage:tabBarBack!,lightColor:accentColor)
    }
    
    // TODO: Can both tables be in superview?
    func reloadTable() {
        if ordersTV.view.superview != nil {
            reloadAndStyleTable(ordersTV)
            ordersTV.addBadge()
            println("reloaded order")
        }
        
        if fufilledTV.view.superview != nil {
            reloadAndStyleTable(fufilledTV)
            println("reloaded fufilled")
        }
               
    }
    
    
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {

        switch (item.tag)
        {
            
        case 0:
            println("0")
            text = "\(ordersTV.ordersItems.count) Orders"
            darkAccentColor = UIColor.flatMagentaColorDark()
            accentColor = UIColor.flatMagentaColor()
            reloadAndStyleTable(ordersTV)

        case 1:
            println("1")
            text = "\(fufilledTV.fufilledItems.count) Fufilled"
            darkAccentColor = UIColor.flatSkyBlueColorDark()
            accentColor = UIColor.flatSkyBlueColor()
            reloadAndStyleTable(fufilledTV)
            
        case 2:
            println("2")
            println("Camera")
            self.tabBar.hidden = true
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            createCameraUI()
            
        case 3:
            println("3")
            text = "\(ordersTV.ordersItems.count + fufilledTV.fufilledItems.count) Sales"
            darkAccentColor = UIColor.flatMintColorDark()
            accentColor = UIColor.flatMintColor()
        
        case 4:
            println("4")
            println("Settings")
          

        default:
            println("error")
        }
        self.viewWillAppear(true)

    }

    func createCameraUI()
    {
        dealViewInfo.lblCompanyName.text = "Test Company"
        dealViewInfo.lblDealName.text = "Test Deal"
        dealViewInfo.lblPrice.text = "$23"
        self.view.addSubview(dealViewInfo)
        timerView.lblTime.text = "30"
        self.view.addSubview(timerView)
        captureButtonCreation()
      
    }
    
    func captureButtonCreation()
    {
        captureButton.backgroundColor = UIColor.flatMintColor()
        
        captureButton.setTitle("Capture Deal", forState: .Normal)
        captureButton.titleLabel?.font = UIFont(name: "Montserrat", size: 16)
        captureButton.titleLabel?.textColor = UIColor.whiteColor()
        captureButton.addTarget(self, action: "pressed", forControlEvents: .TouchUpInside)

        self.view.addSubview(captureButton)
   
    }
    
    func pressed()
    {
        self.selectedIndex = 0
        text = "\(ordersTV.ordersItems.count) Orders"
        darkAccentColor = UIColor.flatMagentaColorDark()
        accentColor = UIColor.flatMagentaColor()
        reloadAndStyleTable(ordersTV)
        self.viewWillAppear(true)

        self.tabBar.hidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        dealViewInfo.removeFromSuperview()
        captureButton.removeFromSuperview()
        timerView.removeFromSuperview()
        

    }
    
    private func reloadAndStyleTable(table: GenericTableView) {
        table.viewDidLoad()
        table.tableView.reloadData()
        table.darkAccentColor = darkAccentColor
        table.accentColor = accentColor
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
