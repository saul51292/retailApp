//
//  ImageTakenVC.swift
//  retailApp
//
//  Created by Saul on 1/20/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ImageTakenVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var imageView: UIImageView!
    var dealViewInfo : DealViewInfo!
    var timerView : TimerView!
    let styleManager = StyleManager()
    var captureButton = UIButton(frame:(CGRectMake (0,UIScreen.mainScreen().bounds.height - 50,UIScreen.mainScreen().bounds.width,50)))
       var image : UIImage!
    
    var tagXCoord = CGFloat(10)
    var tagYCoord = UIScreen.mainScreen().bounds.height - 320
    var addTextField = UITextField(frame:CGRectMake(10,UIScreen.mainScreen().bounds.height - 280, UIScreen.mainScreen().bounds.width-20, 40))
    var addTagButton = UIButton(frame:(CGRectMake(UIScreen.mainScreen().bounds.width - 80, UIScreen.mainScreen().bounds.height - 185, 50, 50)))
    
    var totalTagFrameWidth = CGFloat(0)
    var arrayOfTags = [UIButton]()
    
    
    

    
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
        createTagButton()

        
    }
    
    func createTagButton()
    {
        
        addTagButton.layer.cornerRadius = 25
        styleManager.styleTagButton(addTagButton,text: "+")
        addTagButton.titleLabel?.font = UIFont(name: "Montserrat", size: 25)
        addTagButton.addTarget(self, action: "createTagTextField", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(addTagButton)
    }
    
 
    func createNewButton(text:String)
    {
        var button = UIButton(frame:CGRectMake(tagXCoord, tagYCoord, 50, 50))
        styleManager.styleTagButton(button,text: text)
        button.layer.cornerRadius = 4
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 2, 0, 2)
        button.sizeToFit()
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        totalTagFrameWidth += button.frame.width
        arrayOfTags.append(button)
        tagXCoord += (button.frame.width + 10)
        button.addTarget(self, action: "removeSelf:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }

    
    func removeSelf(sender:UIButton)
    {
        if(sender == arrayOfTags.last)
        {
            sender.removeFromSuperview()
            var toRemove = find(arrayOfTags, sender)!
            arrayOfTags.removeAtIndex(toRemove)
            totalTagFrameWidth -= sender.frame.width
            tagXCoord -= (sender.frame.width + 10)
        }
        else{
            println("Not last. Remove last first")
        }

    }
    
    func createTagTextField()
    {
        addTextField.hidden = false
        addTagButton.hidden = true
        addTextField.delegate = self
        styleManager.styleTagText(addTextField)
        addTextField.attributedPlaceholder = NSAttributedString(string:"Add Tag", attributes:[NSForegroundColorAttributeName: UIColor.darkGrayColor()])
        addTextField.text = "#"
        addTextField.becomeFirstResponder()
        self.view.addSubview(addTextField)
       
        for item in arrayOfTags
        {
            item.transform = CGAffineTransformIdentity

        }
        
    }
    
    func addNewTag(text:String)
    {
        var fullWidth = addTextField.frame.width/1.5
        if(totalTagFrameWidth > fullWidth)
        {
            totalTagFrameWidth = 0
            tagYCoord -= 40
            tagXCoord = 10
        }
            createNewButton(text)
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


    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if(arrayOfTags.count < 4)
        {
            addNewTag(textField.text)
            textField.text = "#"
            return true
        }
        addNewTag(textField.text)
        addTextField.hidden = true
        textField.resignFirstResponder()
        return false
        
        
    }
  
    
    func textFieldDidEndEditing(textField: UITextField) {
        if(arrayOfTags.count < 4)
        {
            addTagButton.hidden = false
        }
        else {
            addTagButton.hidden = true
        }
        
        
        for item in arrayOfTags {
            
            item.transform = CGAffineTransformMakeTranslation(0, 60)
        }
        addTextField.hidden = true
        println("ended")
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
