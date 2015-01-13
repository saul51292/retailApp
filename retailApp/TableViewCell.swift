//
//  TableViewCell.swift
//  retailApp
//
//  Created by Saul on 1/13/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var userPic: UIImageView!
    @IBOutlet var timePurchase: UILabel!
    @IBOutlet var userName: UILabel!
    @IBOutlet var actionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        StyleManager().userPicStyling(userPic,lightColor:UIColor.flatSkyBlueColorDark())
        timePurchase.textColor = UIColor.flatSkyBlueColorDark()
        userName.textColor = UIColor.flatSkyBlueColorDark()
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
