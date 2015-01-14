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
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transportItems.count
    }
    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("transportCell") as TableViewCell
        styleManager.tableViewCellStyling(cell,darkColor:darkAccentColor)
        
        cell.userName.text = transportItems[indexPath.row]
        cell.timePurchase.text = time[indexPath.row]
        
        
        cell.leftButtons = [MGSwipeButton(title: "test", backgroundColor: UIColor.flatWatermelonColorDark())]
        cell.leftSwipeSettings.transition = MGSwipeTransition.TransitionDrag
        
        
        var imageName = UIImage(named: transportItems[indexPath.row])
        cell.userPic!.image = imageName
        cell.userPic!.tag = indexPath.row
        cell.userPic!.userInteractionEnabled = true
        cell.userPic!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "handleTap:"))
    
        //Testing
        if(indexPath.row % 2 == 0)
        {
            cell.changeActionButton("Processing", color: UIColor.flatSkyBlueColorDark())
        }
            
        else if(indexPath.row % 3 == 0)
        {
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
