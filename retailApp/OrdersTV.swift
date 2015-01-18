//
//  OrdersTV.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class OrdersTV: GenericTableView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBadge()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersItems.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as TableViewCell
        cell.actionButton.backgroundColor = darkAccentColor
    }
    
    func swipeTableCell(cell: TableViewCell!, tappedButtonAtIndex index: Int, direction: MGSwipeDirection, fromExpansion: Bool) -> Bool {
        println("Active")
        if direction == MGSwipeDirection.LeftToRight && index == 0 {
            //delete button
            var indexPath = tableView.indexPathForCell(cell)
            self.ordersItems.removeAtIndex(indexPath!.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Right)
            addBadge()
        }
        
        return true
    }
    
    
    func addBadge()
    {
        var tabArray = tabBarController?.tabBar.items as NSArray!
        var tabItem = tabArray.objectAtIndex(1) as UITabBarItem
        tabItem.badgeValue = String(self.ordersItems.count)
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("transportCell") as TableViewCell
        cell.delegate = self
        styleManager.tableViewCellStyling(cell,darkColor:darkAccentColor)
        cell.userName.text = ordersItems[indexPath.row]
        cell.timePurchase.text = time[indexPath.row]
        
        let imageName = UIImage(named: ordersItems[indexPath.row])
        cell.userPic!.image = imageName
        cell.userPic!.tag = indexPath.row
        cell.userPic!.userInteractionEnabled = true
        cell.userPic!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "handleTap:"))
    
        //Testing
        if indexPath.row % 2 == 0 {
            cell.changeActionButton("Processing", color: UIColor.flatSkyBlueColorDark())
        } else if indexPath.row % 3 == 0 {
            cell.changeActionButton("Cancelled", color: UIColor.flatRedColorDark())
        }

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
