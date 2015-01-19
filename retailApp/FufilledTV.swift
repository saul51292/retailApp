//
//  FufilledTV.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class FufilledTV: GenericTableView {
    let exData = dataArr.filter() { (order) in
        order.orderStatus == OrderStatus.Fufilled
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var nib = UINib(nibName: OrderCellIdentifier, bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: OrderCellIdentifier)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
        println(fufilledItems)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exData.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as OrderCell
        cell.statusBttn.backgroundColor = darkAccentColor
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(OrderCellIdentifier, forIndexPath: indexPath) as OrderCell

        cell.delegate = self
        cell.setOrder(exData[indexPath.row])
        cell.setCellColorTheme(darkAccentColor)
        
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
