//
//  OrdersTV.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class OrdersTV: GenericTableView {
    var exData = dataArr.filter() { (order) in
        order.orderStatus != OrderStatus.Fufilled
    }
    
    var filteredData = dataArr
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var nib = UINib(nibName: OrderCellIdentifier, bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: OrderCellIdentifier)
        self.searchDisplayController?.searchResultsTableView.separatorColor = UIColor.clearColor()
        self.searchDisplayController?.searchResultsTableView.backgroundColor = UIColor.flatWhiteColor()

        
        updateDataSource()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController?.searchResultsTableView {
            return filteredData.count
        } else {
            return exData.count
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as OrderCell
        cell.statusBttn.backgroundColor = darkAccentColor
    }
    
    private func updateDataSource() {
        exData = dataArr.filter() { (order) in
            order.orderStatus != OrderStatus.Fufilled
        }
    }
    
    func filterContentForSearchText(searchText: String) {
        self.filteredData = self.exData.filter({( order : Order) -> Bool in
            var categoryMatch = (order.orderStatus != OrderStatus.Fufilled)
            var stringMatch = order.name.rangeOfString(searchText)
            return categoryMatch && (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }
    
    // FIXME: There are too many steps here to move a cell
    func swipeTableCell(cell: OrderCell!, tappedButtonAtIndex index: Int, direction: MGSwipeDirection, fromExpansion: Bool) -> Bool {
        println("Active")
        if direction == MGSwipeDirection.LeftToRight && index == 0 {
            //delete button
            let indexPath = tableView.indexPathForCell(cell)
            cell.completeOrder()
            updateDataSource()
            tableView.reloadData()
        }
        
        return true
    }
    
    
    //TODO: Add more subtle badge icon
    func addBadge() {
        var tabArray = tabBarController?.tabBar.items as NSArray!
        var tabItem = tabArray.objectAtIndex(0) as UITabBarItem
        tabItem.badgeValue = String(self.exData.count)
        navigationController?.navigationBar.topItem?.title = "\(tabItem.badgeValue!) Orders"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(OrderCellIdentifier) as OrderCell
        cell.delegate = self
        cell.setCellColorTheme(darkAccentColor)

        var order : Order
        
        // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
        if tableView == self.searchDisplayController!.searchResultsTableView {
            order = filteredData[indexPath.row]
        } else {
            order = exData[indexPath.row]
        }
        cell.setOrder(order)
        
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
