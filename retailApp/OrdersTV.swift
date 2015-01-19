//
//  OrdersTV.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class OrdersTV: GenericTableView {
    let exData = dataArr.filter() { (order) in
        order.orderStatus != OrderStatus.Fufilled
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var nib = UINib(nibName: OrderCellIdentifier, bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: OrderCellIdentifier)
        addBadge()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exData.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as OrderCell
        cell.statusBttn.backgroundColor = darkAccentColor
    }
    
    
    func swipeTableCell(cell: OrderCell!, tappedButtonAtIndex index: Int, direction: MGSwipeDirection, fromExpansion: Bool) -> Bool {
        println("Active")
        if direction == MGSwipeDirection.LeftToRight && index == 0 {
            //delete button
            let indexPath = tableView.indexPathForCell(cell)
            self.ordersItems.removeAtIndex(indexPath!.row)
//            self.tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Right)
            addBadge()
        }
        
        return true
    }
    
    
    func addBadge() {
        var tabArray = tabBarController?.tabBar.items as NSArray!
        var tabItem = tabArray.objectAtIndex(0) as UITabBarItem
        tabItem.badgeValue = String(self.ordersItems.count)
        navigationController?.navigationBar.topItem?.title = "\(tabItem.badgeValue!) Orders"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(OrderCellIdentifier) as OrderCell
        cell.delegate = self
        cell.setOrder(exData[indexPath.row])
        cell.setCellColorTheme(darkAccentColor)
        
        return cell
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
