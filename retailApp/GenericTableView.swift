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
    var showUser = UserOverview(frame: CGRectMake(0, 40, 256, 265))

    var time = ["1:00","1:15","1:30","1:45","2:00","2:15","2:30","2:45","3:00","3:15","3:15"]

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
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as TableViewCell
        cell.actionButton.backgroundColor = darkAccentColor
        
    }
    
    
    
    override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var cell = tableView.cellForRowAtIndexPath(indexPath) as TableViewCell
        
        showUser.center = tableView.center
        showUser.frame = CGRectOffset(showUser.frame, 0, -100)
        showUser.userPicture.image = cell.userPic.image
        showUser.userName.text = cell.userName.text
        showUser.styleUserOverview(darkAccentColor)
        
        self.tableView.addSubview(showUser)
        
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        cell.actionButton.backgroundColor = darkAccentColor
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