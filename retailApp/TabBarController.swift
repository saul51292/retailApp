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
    var darkAccentColor : UIColor!
    var accentColor : UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.hidden = true
        fufilledTV = self.childViewControllers[0] as FufilledTV
        ordersTV = self.childViewControllers[1] as OrdersTV
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
            println("reloaded order")
        }
        
        if fufilledTV.view.superview != nil {
            reloadAndStyleTable(fufilledTV)
            println("reloaded fufilled")
        }
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
