//
//  DealViewInfo.swift
//  Checkit
//
//  Created by alex livenson on 11/18/14.
//  Copyright (c) 2014 Alex Livenson. All rights reserved.
//

import UIKit

class DealViewInfo: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblDealName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet var priceView: UIView!
    // Responsible for anarchiving the view (nib file) -> associate this class with the nib
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    

    
    private func xibSetup() {
        contentView = loadViewFromNib("DealViewInfo")
        contentView.frame = bounds
        addSubview(contentView)
    }

}
