//
//  OrdersTV.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class OrdersTV: GenericTableView, UISearchBarDelegate {
    
    @IBOutlet weak var orderSearchBar: UISearchBar!
    var showUserVC = UserOverviewVC()

    
    var exData = dataArr.filter() { (order) in
        order.orderStatus != OrderStatus.Fufilled
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var nib = UINib(nibName: OrderCellIdentifier, bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: OrderCellIdentifier)
        orderSearchBar.delegate = self
    }
    
    override func styleTableView() {
        super.styleTableView()
        self.searchDisplayController?.searchResultsTableView.separatorColor = UIColor.clearColor()
        self.searchDisplayController?.searchResultsTableView.backgroundColor = UIColor.flatWhiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exData.count
    }
    
    private func resetSearch() {
        exData = dataArr.filter() { (order) in
            order.orderStatus != OrderStatus.Fufilled
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            resetSearch()
        } else {
            self.exData = dataArr.filter({( order : Order) -> Bool in
                var categoryMatch = (order.orderStatus != OrderStatus.Fufilled)
                var stringMatch = order.name.rangeOfString(searchText, options: .CaseInsensitiveSearch)
                return categoryMatch && (stringMatch != nil)
            })
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        resetSearch()
        tableView.reloadData()
    }
    
   
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as OrderCell
        cell.statusBttn.backgroundColor = darkAccentColor
        showUserVC.showUser.colorUserOverview(darkAccentColor)
        showUserVC.showUser.styleUserPicture(darkAccentColor)
        
        let imageName = UIImage(named: exData[indexPath.row].name)
        showUserVC.showUser.userPicture.image = imageName
        showUserVC.showUser.userName.text = exData[indexPath.row].name
        showUserVC.setUpUserOverviewVC()
        self.presentViewController(showUserVC, animated: true, completion: nil)

       
        
    }
    
    
  

    // FIXME: There are too many steps here to move a cell
    func swipeTableCell(cell: OrderCell!, tappedButtonAtIndex index: Int, direction: MGSwipeDirection, fromExpansion: Bool) -> Bool {
        if direction == MGSwipeDirection.LeftToRight && index == 0 {
            //delete button
            let indexPath = tableView.indexPathForCell(cell)
            cell.completeOrder()
            tableView.reloadData()
        }
        
        return true
    }
    
    //TODO: Add more subtle badge icon. 
    // NOTE: This seems like it should be done in the tabBarController
    func addBadge() {
        let tabArray = tabBarController?.tabBar.items as NSArray!
        let tabItem = tabArray.objectAtIndex(0) as UITabBarItem
        tabItem.badgeValue = String(self.exData.count)
        navigationController?.navigationBar.topItem?.title = "\(tabItem.badgeValue!) Orders"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(OrderCellIdentifier) as OrderCell
        cell.delegate = self
        cell.setCellColorTheme(darkAccentColor)
        cell.setOrder(exData[indexPath.row])
        
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
