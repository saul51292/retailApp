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
    var captureButton = UIButton(frame:(CGRectMake (0,UIScreen.mainScreen().bounds.height - 50,UIScreen.mainScreen().bounds.width,50)))
       var image : UIImage!
    
    var tagXCoord = CGFloat(10)
    var tagYCoord = UIScreen.mainScreen().bounds.height - 320
    var addTextField = UITextField(frame:CGRectMake(10,UIScreen.mainScreen().bounds.height - 280, UIScreen.mainScreen().bounds.width-20, 40))
    var addTagButton = UIButton(frame:(CGRectMake(UIScreen.mainScreen().bounds.width - 80, UIScreen.mainScreen().bounds.height - 280, 50, 50)))
    
    var tagsLeft = 0
    var totalTagFrameWidth = CGFloat(0)

    

    
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
        styleTagButton(addTagButton,text: "+")
        addTagButton.titleLabel?.font = UIFont(name: "Montserrat", size: 25)
        addTagButton.addTarget(self, action: "createTagTextField", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(addTagButton)
    }
    
    func styleTagButton(button:UIButton,text:String)
    {
        button.backgroundColor = UIColor.flatSkyBlueColor()
        button.setTitle(text, forState: .Normal)
        button.titleLabel?.textColor = UIColor.whiteColor()
        button.titleLabel?.font = UIFont(name: "Montserrat", size: 14)
        
    }
    
    func styleTagText(textField:UITextField)
    {
        textField.layer.cornerRadius = 10
        textField.backgroundColor = UIColor.flatGrayColor().colorWithAlphaComponent(0.8)
        textField.textAlignment = .Center
        textField.textColor = UIColor.whiteColor()
        textField.font = UIFont(name: "Montserrat", size: 16)
        
    }
    
    func createNewButton(text:String)
    {
        var button = UIButton(frame:CGRectMake(tagXCoord, tagYCoord, 50, 50))
        styleTagButton(button,text: text)
        button.layer.cornerRadius = 4
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 2, 0, 2)
        button.sizeToFit()
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        totalTagFrameWidth += button.frame.width
        tagXCoord += (button.frame.width + 10)
        self.view.addSubview(button)
    
        
        
    }
    
    func createTagTextField()
    {
        addTextField.hidden = false
        addTagButton.hidden = true
        addTextField.delegate = self
        styleTagText(addTextField)
        self.view.addSubview(addTextField)
    }
    
    func addNewTag(text:String)
    {
        var fullWidth = addTextField.frame.width - 70
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
        if(tagsLeft < 4)
        {
            addNewTag(textField.text)
            textField.text = ""
            tagsLeft++
            return true
        }
        tagsLeft++
        addNewTag(textField.text)
        addTextField.hidden = true
        textField.resignFirstResponder()
        return false
        
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if(tagsLeft < 5)
        {
            addTagButton.hidden = false
        }
        else {
            addTagButton.hidden = true
        }
        addTextField.hidden = true
        println("ended")
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var txtAfterUpdate:NSString = textField.text as NSString
        txtAfterUpdate = txtAfterUpdate.stringByReplacingCharactersInRange(range, withString: string)
        
        println(txtAfterUpdate)
        return true
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
