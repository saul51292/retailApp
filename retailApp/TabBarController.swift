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
    var closeButton  = UIButton(frame: CGRectMake(20, 37, 30, 30))
    
    var text = "Orders"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ordersTV = self.childViewControllers[0] as OrdersTV
        fufilledTV = self.childViewControllers[1] as FufilledTV
        progressVC = self.childViewControllers[3] as ProgressVC
        
        text = "\(ordersTV.exData.count) Orders"
        navigationController?.navigationBar.topItem?.title = self.text
        reloadAndStyleTable(ordersTV)

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
        }
        
        if fufilledTV.view.superview != nil {
            reloadAndStyleTable(fufilledTV)
        }
               
    }
    
    
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {

        switch (item.tag){
        case 0:
            text = "\(ordersTV.exData.count) Orders"
            darkAccentColor = UIColor.flatMagentaColorDark()
            accentColor = UIColor.flatMagentaColor()
            reloadAndStyleTable(ordersTV)

        case 1:
            text = "\(fufilledTV.exData.count) Fufilled"
            darkAccentColor = UIColor.flatSkyBlueColorDark()
            accentColor = UIColor.flatSkyBlueColor()
            reloadAndStyleTable(fufilledTV)
            
        case 2:
            self.tabBar.hidden = true
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            createCloseButton()
            
        case 3:
            text = "\(ordersTV.exData.count + fufilledTV.exData.count) Sales"
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

    func createCloseButton() {
        closeButton.setImage(UIImage(named: "close"), forState: .Normal)
        closeButton.addTarget(self, action: "closeCamera", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(closeButton)
    }
    
    func closeCamera() {
        self.selectedIndex = 0
        darkAccentColor = UIColor.flatMagentaColorDark()
        accentColor = UIColor.flatMagentaColor()
        reloadAndStyleTable(ordersTV)
        self.viewWillAppear(true)

        self.tabBar.hidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        closeButton.removeFromSuperview()
    }
    
    // TODO: Why is this not in in GenericTableView?
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
