//
//  TableViewCell.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class TableViewCell: MGSwipeTableCell,MGSwipeTableCellDelegate {
    @IBOutlet var userPic: UIImageView!
    @IBOutlet var timePurchase: UILabel!
    @IBOutlet var userName: UILabel!
    @IBOutlet var actionButton: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        StyleManager().userPicStyling(userPic)
        actionButton.layer.cornerRadius = 4
    }
    
    
   
    func createLeftButtons()->[AnyObject]
    {
        
        self.leftButtons = [MGSwipeButton(title: "left", backgroundColor: UIColor.flatWatermelonColorDark()),MGSwipeButton(title: "left2", backgroundColor: UIColor.flatTealColorDark())]

        return self.leftButtons
    }

     
    
    func changeActionButton(title:String,color:UIColor) {
        actionButton.setTitle(title, forState: .Normal)
        actionButton.titleLabel?.adjustsFontSizeToFitWidth = true
        actionButton.backgroundColor = color
    }
    
  
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)      
    }

}
