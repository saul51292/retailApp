//
//  FufilledTV.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class FufilledTV: GenericTableView {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(fufilledItems)

        tableView.reloadData()

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
        return fufilledItems.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as TableViewCell
        cell.actionButton.backgroundColor = darkAccentColor
    }
    
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("transportCell", forIndexPath: indexPath) as TableViewCell
        cell.delegate = self
        styleManager.tableViewCellStyling(cell,darkColor:darkAccentColor)
        
        cell.userName.text = fufilledItems[indexPath.row]
        cell.timePurchase.text = time[indexPath.row]
        var imageName = UIImage(named: fufilledItems[indexPath.row])
        cell.userPic!.image = imageName
        cell.userPic!.tag = indexPath.row
        
        
//        cell.userPic!.userInteractionEnabled = true
//        cell.userPic!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "handleTap:"))

        cell.changeActionButton("Fufilled", color: UIColor.flatSkyBlueColor())
        
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
