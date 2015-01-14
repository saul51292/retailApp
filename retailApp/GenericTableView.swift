//
//  OrdersView.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class GenericTableView: UITableViewController {
    
   
    let styleManager = StyleManager()
    var accentColor : UIColor!
    var darkAccentColor : UIColor!

    var transportItems = ["Bus","Helicopter","Truck","Boat","Bicycle","Motorcycle","Plane","Train","Car","Scooter","Caravan"]
    var time = ["1:00","1:15","1:30","1:45","2:00","2:15","2:30","2:45","3:00","3:15","3:15"]
    
     var showUser = UserOverview(frame: CGRectMake(0, 40, 256, 200))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = UIColor.clearColor()
        tableView.backgroundColor = styleManager.backColor

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleTap(gestureRecognizer: UITapGestureRecognizer)
    {
        var number = gestureRecognizer.view?.tag
        var imageName = UIImage(named: transportItems[number!])
        
        showUser.userPicture.image = imageName
        showUser.userName.text = transportItems[number!]
        println(showUser.userName.text)
        showUser.center = self.view.center
        showUser.frame = CGRectOffset(showUser.frame, 0, -40)
        showUser.styleShowUser(self.view)
    }
    
    func actionController(action:UIAlertAction,tableView:UITableView,indexPath:NSIndexPath)
    {
        switch action.style{
        case .Default:
            println("default")
            
        case .Cancel:
            println("cancel")
            
        case .Destructive:
            println("destructive")
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func createAlert(tableView:UITableView,indexPath:NSIndexPath)
    {
        var alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.addAction(UIAlertAction(title: "Mark as Fufilled", style: .Default, handler: { action in self.actionController(action,tableView:tableView,indexPath:indexPath)}))
         alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { action in self.actionController(action,tableView:tableView,indexPath:indexPath)}))
        alert.addAction(UIAlertAction(title: "Delete", style: .Destructive, handler: { action in self.actionController(action,tableView:tableView,indexPath:indexPath)}))

        self.presentViewController(alert, animated: true, completion: nil)

    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
       
        var cell = tableView.cellForRowAtIndexPath(indexPath) as TableViewCell
        cell.actionButton.backgroundColor = darkAccentColor
        
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as TableViewCell
        cell.actionButton.backgroundColor = darkAccentColor
        createAlert(tableView,indexPath:indexPath)



    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier("transportCell") as TableViewCell
        styleManager.tableViewCellStyling(cell,darkColor:darkAccentColor)
        
        
        
        
        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
        }
    
    }