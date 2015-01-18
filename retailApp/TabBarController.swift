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
    var darkAccentColor = UIColor.flatMintColorDark()
    var accentColor = UIColor.flatMintColor()
    var progressVC : ProgressVC!
    
    
    
    var text = "Sales"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressVC = self.childViewControllers[0] as ProgressVC
        ordersTV = self.childViewControllers[1] as OrdersTV
        fufilledTV = self.childViewControllers[2] as FufilledTV
        ordersTV.addBadge()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            text = "Sales"
            darkAccentColor = UIColor.flatMintColorDark()
            accentColor = UIColor.flatMintColor()

        case 1:
            println("1")
            text = "Pending"
            darkAccentColor = UIColor.flatMagentaColorDark()
            accentColor = UIColor.flatMagentaColor()
            reloadAndStyleTable(ordersTV)

        case 2:
            println("2")
            text = "Fufilled"
            darkAccentColor = UIColor.flatSkyBlueColorDark()
            accentColor = UIColor.flatSkyBlueColor()
            reloadAndStyleTable(fufilledTV)

        default:
            println("error")
        }
        self.parentViewController?.viewWillAppear(true)

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
