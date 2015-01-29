//
//  UserOverviewVC.swift
//  retailApp
//
//  Created by Saul on 1/28/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class UserOverviewVC: UIViewController {
  
     var showUser = UserOverview(frame: CGRectMake(0,0, 263, 318))
    let tapRec = UITapGestureRecognizer()


    override func viewDidLoad() {
        super.viewDidLoad()
        showUser.center.x = self.view.center.x
        self.view.addSubview(showUser)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
         animateViewSpringingUp(showUser)
    }
    
    func animateViewSpringingUp(view:UIView){
        UIView.animateWithDuration(0.6, delay: 0.0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 0.8,
                options: .CurveEaseInOut,
                animations:  {
                    
                    view.transform = CGAffineTransformMakeTranslation(0,UIScreen.mainScreen().bounds.height/4)
                }, nil)
        
        }
    
    func bringViewsBackDown(view:UIView){
        UIView.animateWithDuration(0.6, delay: 0.0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.8,
            options: .CurveEaseInOut,
            animations:  {
                view.transform = CGAffineTransformIdentity

            }, nil)

    }


    func tappedView() {
        self.dismissViewControllerAnimated(true, completion: nil)
        bringViewsBackDown(showUser)
        
    }
    
    
    func addTapRecognizer() {
        tapRec.addTarget(self, action: "tappedView")
        self.view.addGestureRecognizer(tapRec)
    }

    
    func setUpUserOverviewVC()
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
