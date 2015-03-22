//
//  UserOverviewVC.swift
//  retailApp
//
//  Created by Saul on 1/28/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class OverviewVC: UIViewController {
  
    var showUser = UserOverview(frame: CGRectMake(0,0, 263, 318))
    var cashOut = cashOutView(frame: CGRectMake(0,0, 263, 318))
    let tapRec = UITapGestureRecognizer()
    var userView = UIView()


    override func viewDidLoad() {
        super.viewDidLoad()
        userView.backgroundColor = UIColor.clearColor()
        userView.center.x = self.view.center.x

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.view.addSubview(userView)
         animateViewSpringingUp()
    }
    
    func animateViewSpringingUp(){
        UIView.animateWithDuration(0.6, delay: 0.0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 0.8,
                options: .CurveEaseInOut,
                animations:  {
                    
                    self.userView.transform = CGAffineTransformMakeTranslation(0,UIScreen.mainScreen().bounds.height/4)
                }, completion: nil)
        
        }
    
    func bringViewsBackDown(){
        UIView.animateWithDuration(0.6, delay: 0.0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.8,
            options: .CurveEaseInOut,
            animations:  {
                self.userView.transform = CGAffineTransformIdentity

            }, completion: nil)

    }


    func tappedView() {
        self.dismissViewControllerAnimated(true, completion: nil)
        bringViewsBackDown()
        
    }
    
    
    func addTapRecognizer() {
        tapRec.addTarget(self, action: "tappedView")
        self.view.addGestureRecognizer(tapRec)
    }

    
    func setUpOverviewVC()
    {
        addTapRecognizer()
        self.modalPresentationStyle = .OverFullScreen
        self.modalTransitionStyle = .CrossDissolve
        self.view.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.6)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
