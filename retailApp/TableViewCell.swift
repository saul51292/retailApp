//
//  TableViewCell.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class TableViewCell: MGSwipeTableCell {
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
    
    func changeActionButton(title:String,color:UIColor)
    {
        actionButton.setTitle(title, forState: .Normal)
        actionButton.titleLabel?.adjustsFontSizeToFitWidth = true
        actionButton.backgroundColor = color

        
    }
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
