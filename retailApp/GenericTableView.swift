//
//  OrdersView.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class GenericTableView: UITableViewController, UITableViewDelegate, UITableViewDataSource , MGSwipeTableCellDelegate {
    
    let styleManager = StyleManager()
    
    var ordersItems = ["Bus", "Helicopter", "Truck", "Boat", "Bicycle", "Motorcycle", "Plane", "Train", "Car", "Scooter", "Caravan"]
    var fufilledItems = ["Bus", "Helicopter", "Truck", "Boat", "Bicycle"]
    
    var time = ["1:00","1:15","1:30","1:45","2:00","2:15","2:30","2:45","3:00","3:15","3:15"]
    
    let showUser = UserOverview(frame: CGRectMake(0, 40, 256, 200))
    
    var accentColor : UIColor!
    var darkAccentColor : UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        tableView.separatorColor = UIColor.clearColor()
        tableView.backgroundColor = styleManager.backColor
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        let number = gestureRecognizer.view?.tag
        let imageName = UIImage(named: ordersItems[number!])
        
        showUser.userPicture.image = imageName
        showUser.userName.text = ordersItems[number!]
        println(showUser.userName.text)
        showUser.center = self.view.center
        showUser.frame = CGRectOffset(showUser.frame, 0, -40)
        // TODO: Why is this not done in UserOverView?
        showUser.styleShowUser(self.view)
    }
    
    func actionController(action:UIAlertAction,tableView:UITableView,indexPath:NSIndexPath) {
        switch action.style{
        case .Default:
            self.ordersItems.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Right)

            println("default")
            
        case .Cancel:
            println("cancel")
            
        case .Destructive:
            self.ordersItems.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            println("destructive")
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func createAlert(tableView:UITableView,indexPath:NSIndexPath) {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.addAction(UIAlertAction(title: "Mark as Fufilled", style: .Default, handler: { action in self.actionController(action,tableView:tableView,indexPath:indexPath)}))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { action in self.actionController(action,tableView:tableView,indexPath:indexPath)}))
        alert.addAction(UIAlertAction(title: "Delete", style: .Destructive, handler: { action in self.actionController(action,tableView:tableView,indexPath:indexPath)}))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as TableViewCell
        cell.actionButton.backgroundColor = darkAccentColor
    }
   

    func swipeTableCell(cell: TableViewCell!, swipeButtonsForDirection direction: MGSwipeDirection, swipeSettings: MGSwipeSettings!, expansionSettings: MGSwipeExpansionSettings!) -> [AnyObject]! {
        
        swipeSettings.transition = MGSwipeTransition.TransitionDrag
        
        if (direction == MGSwipeDirection.LeftToRight)
        {
            expansionSettings.buttonIndex = 0
            expansionSettings.fillOnTrigger = true
            return cell.createLeftButtons()
        }
            
        else{
            expansionSettings.buttonIndex = 0
            expansionSettings.fillOnTrigger = true
            return cell.createRightButtons()

        }
    }

    
   
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("transportCell") as TableViewCell
        styleManager.tableViewCellStyling(cell,darkColor:darkAccentColor)
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
}