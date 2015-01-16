//
//  ProgressBar.swift
//  retailApp
//
//  Created by Saul on 1/14/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ProgressBar: UIView {
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var overallStats: UILabel!
    @IBOutlet var seenPurchased: UILabel!
    @IBOutlet var maleFemale: UILabel!
    @IBOutlet var avgTime: UILabel!
    @IBOutlet var bottomProgressBar: YLProgressBar!
    @IBOutlet var middleProgressBar: YLProgressBar!
    @IBOutlet var topProgressBar: YLProgressBar!
    @IBOutlet var contentView: UIView!
    
    @IBOutlet var topLeftStat: UIView!
    @IBOutlet var topRightStat: UIView!
    @IBOutlet var bottomLeftStat: UIView!
    @IBOutlet var bottomRightStat: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "ProgressView", bundle: bundle)
        
        // Assumes UIView is top level and only object in CustomView.xib file
        let view = nib.instantiateWithOwner(self, options: nil)[0] as UIView
        return view
    }
    
    //MARK: Layout Subviews
    override func layoutSubviews() {
        styleProgressBar(topProgressBar)
        styleProgressBar(middleProgressBar)
        styleProgressBar(bottomProgressBar)
    }
    
    //MARK: StatView
    func viewLabel(text:String, size:CGFloat, darkColor:UIColor) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat" , size: size)
        label.text = text
        label.textAlignment = .Center
        label.textColor = darkColor
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }
    
    
    func styleStatView(view:UIView, darkColor:UIColor, topTitle:String, bottomTitle:String) {
        let topLabel = viewLabel(topTitle,size:20,darkColor:darkColor)
        let bottomLabel = viewLabel(bottomTitle,size:14,darkColor:darkColor)
        
        topLabel.center = CGPoint(x: 50, y: 35)
        bottomLabel.center = CGPoint(x: 50, y: 60)
        
        view.addSubview(bottomLabel)
        view.addSubview(topLabel)
        
        view.backgroundColor = UIColor.clearColor()
        view.layer.borderWidth = 3
        view.layer.borderColor = darkColor.CGColor
        view.layer.cornerRadius = 50
    }
    
    //MARK: Male v Female
    func maleVsFemaleProgressBar(percentMale:CGFloat, percentFemale:CGFloat, progressBar:YLProgressBar) {
        progressBar.indicatorTextLabel.textColor = UIColor.whiteColor()
        
        if percentMale == percentFemale {
            progressBar.progressTintColors = [UIColor.flatSkyBlueColorDark()]
            progressBar.setProgress(percentMale, animated: true)
            progressBar.indicatorTextLabel.text = "50/50"
        } else if percentMale >= percentFemale {
            progressBar.progressTintColors = [UIColor.flatSkyBlueColor()]
            progressBar.setProgress(percentMale, animated: true)
        } else {
            progressBar.progressTintColors = [UIColor.flatPinkColor()]
            progressBar.setProgress(percentFemale, animated: true)
        }
    }
    
    
    //MARK: Seen v Purchase
    func seenVsPurchased(numberSeen:CGFloat, numberPurchased:CGFloat, progressBar:YLProgressBar) {
        var percentPurchased = (numberPurchased/numberSeen) * 100
        progressBar.indicatorTextLabel.textColor = UIColor.whiteColor()
        
        switch percentPurchased{
        case 0...20:
            progressBar.progressTintColors = [UIColor.flatRedColor()]
        case 20...30:
            progressBar.progressTintColors = [UIColor.flatWatermelonColor()]
        case 30...50:
            progressBar.progressTintColors = [UIColor.flatOrangeColor()]
        default:
            progressBar.progressTintColors = [UIColor.flatSkyBlueColor()]
        }
        
        progressBar.setProgress(percentPurchased/100, animated: true)
        println(percentPurchased)
    }
    
    //MARK: Average Swipe
    func timeProgressBar(totalTime:CGFloat, avgTimeToSwipe:CGFloat, progressBar:YLProgressBar) {
        let timeToSwipe = CGFloat(avgTimeToSwipe/totalTime)
        println(timeToSwipe)
        
        progressBar.indicatorTextLabel.textColor = UIColor.whiteColor()
        
        switch avgTimeToSwipe{
        case 0...(totalTime/3):
            progressBar.progressTintColors = [UIColor.flatMintColor()]
        case (totalTime/3)...(totalTime/2):
            progressBar.progressTintColors = [UIColor.flatOrangeColor()]
        case (totalTime/2)...(totalTime/1.5):
            progressBar.progressTintColors = [UIColor.flatWatermelonColor()]
        default:
            progressBar.progressTintColors = [UIColor.flatRedColor()]
        }
        
        progressBar.setProgress(timeToSwipe/100, animated: true)
        topProgressBar.indicatorTextLabel.text = "\(avgTimeToSwipe) S "
        topProgressBar.setProgress(timeToSwipe, animated: true)
        println(timeToSwipe)
    }
    
    
    //MARK: Generic Styling
    func colorLabels(color:UIColor) {
        seenPurchased.textColor = color
        maleFemale.textColor = color
        avgTime.textColor = color
        overallStats.textColor = color
    }
    
    func styleProgressBar(progressBar:YLProgressBar) {
        colorLabels(UIColor.flatGrayColorDark())
        progressBar.type = .Rounded
        progressBar.trackTintColor = UIColor.flatWhiteColorDark()
        progressBar.hideStripes = true
        progressBar.hideGloss = true
        progressBar.behavior = .Default
        progressBar.indicatorTextDisplayMode = .Progress
        progressBar.indicatorTextLabel.font = UIFont(name: "Montserrat", size: 13)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
}
