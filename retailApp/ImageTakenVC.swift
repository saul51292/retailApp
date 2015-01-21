//
//  ImageTakenVC.swift
//  retailApp
//
//  Created by Saul on 1/20/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ImageTakenVC: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var dealViewInfo : DealViewInfo!
    var timerView : TimerView!
    var captureButton = UIButton(frame:(CGRectMake (0,UIScreen.mainScreen().bounds.height - 50,UIScreen.mainScreen().bounds.width,50)))
    
    var image : UIImage!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        createCameraUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createCameraUI() {
        self.view.addSubview(dealViewInfo)
        self.view.addSubview(timerView)
        captureButtonCreation()
        
        
    }
    
    
    func captureButtonCreation() {
        captureButton.backgroundColor = UIColor.flatSkyBlueColor()
        
        captureButton.setTitle("Send Deal", forState: .Normal)
        captureButton.titleLabel?.font = UIFont(name: "Montserrat", size: 16)
        captureButton.titleLabel?.textColor = UIColor.whiteColor()
        captureButton.addTarget(self, action: "dismissVC", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(captureButton)
        
    }
    
    func dismissVC()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
        println("Dismiss Me!")
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
