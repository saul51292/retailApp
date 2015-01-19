//
//  ProgressVC.swift
//  retailApp
//
//  Created by Saul on 1/17/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ProgressVC: UIViewController {

    var darkAccentColor = UIColor.flatMintColorDark()

    @IBOutlet var progressView: ProgressBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Progress View Setup
        progressView.timeProgressBar(30,avgTimeToSwipe:27,progressBar:progressView.topProgressBar)
        progressView.maleVsFemaleProgressBar(0.30,percentFemale:0.70,progressBar:progressView.middleProgressBar)
        progressView.seenVsPurchased(1000,numberPurchased:300,progressBar:progressView.bottomProgressBar)
        
        progressView.styleStatView(progressView.topLeftStat, darkColor:UIColor.flatSkyBlueColorDark(),topTitle:"4,332",bottomTitle:"Views")
        progressView.styleStatView(progressView.topRightStat, darkColor:darkAccentColor, topTitle:"125", bottomTitle:"Sales")
        progressView.styleStatView(progressView.bottomLeftStat, darkColor:UIColor.flatOrangeColorDark(), topTitle:"150",bottomTitle:"Shares")
        progressView.styleStatView(progressView.bottomRightStat, darkColor:UIColor.flatPurpleColor(), topTitle:"$32",bottomTitle:"Avg. Price")

       self.view.backgroundColor = UIColor.flatWhiteColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
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
