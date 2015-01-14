//
//  OrdersView.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class GenericTableView: UITableViewController {
    
    var transportItems = ["Bus","Helicopter","Truck","Boat","Bicycle","Motorcycle","Plane","Train","Car","Scooter","Caravan"]
    var time = ["1:00","1:15","1:30","1:45","2:00","2:15","2:30","2:45","3:00","3:15","3:15"]
    let styleManager = StyleManager()
    
    var accentColor : UIColor!
    var darkAccentColor : UIColor!
    
    
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
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier("transportCell") as TableViewCell
        cell.backgroundColor = UIColor.flatWhiteColor()
        
        cell.userName.text = transportItems[indexPath.row]
        cell.timePurchase.text = time[indexPath.row]
        
        
        if(indexPath.row % 2 == 0)
        {
            cell.changeActionButton("Processing", color: UIColor.flatSkyBlueColorDark())
        }
        
        else if(indexPath.row % 3 == 0)
        {
            cell.changeActionButton("Cancelled", color: UIColor.flatRedColorDark())
        }
        
        cell.timePurchase.textColor = darkAccentColor
        cell.userName.textColor = darkAccentColor
        
        cell.leftButtons = [MGSwipeButton(title: "test", backgroundColor: UIColor.flatWatermelonColorDark())]
        cell.leftSwipeSettings.transition = MGSwipeTransition.TransitionDrag
        var imageName = UIImage(named: transportItems[indexPath.row])
        cell.userPic!.image = imageName
        cell.userPic!.clipsToBounds = true
        if(darkAccentColor != nil){
        cell.userPic!.layer.borderColor = darkAccentColor!.CGColor!
        }
        
        return cell
    }
    
    
    /*
    
    //configure left buttons
    cell.leftButtons = @[[MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"check.png"] backgroundColor:[UIColor greenColor]],
    [MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"fav.png"] backgroundColor:[UIColor blueColor]]];
    cell.leftSwipeSettings.transition = MGSwipeTransition3D;
    
    //configure right buttons
    cell.rightButtons = @[[MGSwipeButton buttonWithTitle:@"Delete" backgroundColor:[UIColor redColor]],
    [MGSwipeButton buttonWithTitle:@"More" backgroundColor:[UIColor lightGrayColor]]];
    cell.rightSwipeSettings.transition = MGSwipeTransition3D;
    return cell;
    }
    
    
    */
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
        }
    
    }