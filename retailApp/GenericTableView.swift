//
//  OrdersView.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class GenericTableView: UITableViewController, MGSwipeTableCellDelegate {
    
    let OrderCellIdentifier = "OrderCell"
    let styleManager = StyleManager()
    
    
    var accentColor : UIColor!
    var darkAccentColor : UIColor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        styleTableView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func styleTableView() {
        tableView.separatorColor = UIColor.clearColor()
        tableView.backgroundColor = styleManager.backColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked( searchBar: UISearchBar!) {
        searchBar.resignFirstResponder()
    }
   
    
   
    
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath)
    {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as OrderCell
        cell.statusBttn.backgroundColor = darkAccentColor
    }
    
    func swipeTableCell(cell: OrderCell!, swipeButtonsForDirection direction: MGSwipeDirection, swipeSettings: MGSwipeSettings!, expansionSettings: MGSwipeExpansionSettings!) -> [AnyObject]! {
        swipeSettings.transition = MGSwipeTransition.TransitionDrag
        expansionSettings.buttonIndex = 0
        expansionSettings.fillOnTrigger = true
        
        if direction == MGSwipeDirection.LeftToRight {
            return cell.createLeftButtons()
        } else {
            return cell.createRightButtons()
        }
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(OrderCellIdentifier) as OrderCell
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
}