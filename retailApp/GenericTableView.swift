//
//  OrdersView.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class GenericTableView: UITableViewController, MGSwipeTableCellDelegate, UISearchBarDelegate {
    
    let OrderCellIdentifier = "OrderCell"
    let styleManager = StyleManager()
    var ordersItems = ["Bus", "Helicopter", "Truck", "Boat", "Bicycle", "Motorcycle", "Plane", "Train", "Car", "Scooter", "Caravan"]
    var fufilledItems = ["Bus", "Helicopter", "Truck", "Boat", "Bicycle"]
    var time = ["1:00","1:15","1:30","1:45","2:00","2:15","2:30","2:45","3:00","3:15","3:15"]
    var searchBar = UISearchBar()
    var searchView = UIView()
    var accentColor : UIColor!
    var darkAccentColor : UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = true
        searchView.frame = CGRectMake(0,0,tableView.frame.width,50)
        searchBar.frame = CGRectMake(0,0,tableView.frame.width,50)
        searchBar.barStyle = .BlackTranslucent
        self.searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        searchView.addSubview(searchBar)
        self.tableView.tableHeaderView = searchView
        tableView.setContentOffset(CGPointMake(0, 50), animated: false)
        
        tableView.separatorColor = UIColor.clearColor()
        tableView.backgroundColor = styleManager.backColor
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked( searchBar: UISearchBar!) {
        searchBar.resignFirstResponder()
    }
    
    // TODO: clean this up
    func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        let number = gestureRecognizer.view?.tag
        let imageName = UIImage(named: ordersItems[number!])
        
        
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
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