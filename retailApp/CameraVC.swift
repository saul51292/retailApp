//
//  CameraVC.swift
//  retailApp
//
//  Created by Saul on 1/19/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices

class CameraVC: UIViewController {
    
    let captureSession = AVCaptureSession()
    var previewLayer : AVCaptureVideoPreviewLayer?
    let stillImageOutput:AVCaptureStillImageOutput?
    var imageData: NSData!
    var dealViewInfo = DealViewInfo(frame:(CGRectMake(0,  UIScreen.mainScreen().bounds.height - 200,  UIScreen.mainScreen().bounds.width, 150)))
    var timerView  = TimerView(frame: CGRectMake(UIScreen.mainScreen().bounds.width - 70, 30, 50, 50))
    var screenSize =  UIScreen.mainScreen().bounds
    var captureButton = UIButton(frame:(CGRectMake (0,UIScreen.mainScreen().bounds.height - 50,UIScreen.mainScreen().bounds.width,50)))



    
    // If we find a device we'll store it here for later use
    var captureDevice : AVCaptureDevice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        
        let devices = AVCaptureDevice.devices()
        
        // Loop through all the capture devices on this phone
        for device in devices {
            // Make sure this particular device supports video
            if (device.hasMediaType(AVMediaTypeVideo)) {
                // Finally check the position and confirm we've got the back camera
                if(device.position == AVCaptureDevicePosition.Back) {
                    captureDevice = device as? AVCaptureDevice
                    if captureDevice != nil {
                        println("Capture device found")
                        beginSession()
                    }
                }
            }
        }
         createCameraUI()
        
    }
    
    func updateDeviceSettings(focusValue : Float, isoValue : Float) {
        if let device = captureDevice {
            if(device.lockForConfiguration(nil)) {
                device.setFocusModeLockedWithLensPosition(focusValue, completionHandler: { (time) -> Void in
                    //
                })
                
                // Adjust the iso to clamp between minIso and maxIso based on the active format
                let minISO = device.activeFormat.minISO
                let maxISO = device.activeFormat.maxISO
                let clampedISO = isoValue * (maxISO - minISO) + minISO
                
                device.setExposureModeCustomWithDuration(AVCaptureExposureDurationCurrent, ISO: clampedISO, completionHandler: { (time) -> Void in
                    //
                })
                
                device.unlockForConfiguration()
            }
        }
    }
    
    func touchPercent(touch : UITouch) -> CGPoint {
        // Get the dimensions of the screen in points
        let screenSize = UIScreen.mainScreen().bounds.size
        
        // Create an empty CGPoint object set to 0, 0
        var touchPer = CGPointZero
        
        // Set the x and y values to be the value of the tapped position, divided by the width/height of the screen
        touchPer.x = touch.locationInView(self.view).x / screenSize.width
        touchPer.y = touch.locationInView(self.view).y / screenSize.height
        
        // Return the populated CGPoint
        return touchPer
    }
    
    
    
    
    
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touchPer = touchPercent( touches.anyObject() as UITouch )
        //focusTo(Float(touchPer.x))
        updateDeviceSettings(Float(touchPer.x), isoValue: Float(touchPer.y))
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        let touchPer = touchPercent( touches.anyObject() as UITouch )
        //focusTo(Float(touchPer.x))
        updateDeviceSettings(Float(touchPer.x), isoValue: Float(touchPer.y))
    }
    
    func configureDevice() {
        if let device = captureDevice {
            device.lockForConfiguration(nil)
            device.focusMode = .Locked
            device.unlockForConfiguration()
        }
        
    }
    
    func beginSession() {
        
        configureDevice()
        
        var err : NSError? = nil
        captureSession.addInput(AVCaptureDeviceInput(device: captureDevice, error: &err))
        
        if err != nil {
            println("error: \(err?.localizedDescription)")
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.view.layer.addSublayer(previewLayer)
        previewLayer?.frame = self.view.layer.frame
        captureSession.startRunning()
    }
    
    func createCameraUI() {
        dealViewInfo.lblCompanyName.text = "The Bruffin Shop"
        self.view.addSubview(dealViewInfo)
        self.view.addSubview(timerView)
        captureButtonCreation()

        
    }

    
    func captureButtonCreation() {
        captureButton.backgroundColor = UIColor.flatMintColor()
        
        captureButton.setTitle("Capture Deal", forState: .Normal)
        captureButton.titleLabel?.font = UIFont(name: "Montserrat", size: 16)
        captureButton.titleLabel?.textColor = UIColor.whiteColor()
        captureButton.addTarget(self, action: "takePhoto", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(captureButton)
        
    }

    
    func takePhoto(){
        
        println("pressed")
        self.stillImageOutput?.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
        if captureSession.canAddOutput(stillImageOutput) {
            captureSession.addOutput(stillImageOutput)
        }
        var videoConnection = stillImageOutput?.connectionWithMediaType(AVMediaTypeVideo)
        
        if videoConnection != nil {
            stillImageOutput?.captureStillImageAsynchronouslyFromConnection(stillImageOutput?.connectionWithMediaType(AVMediaTypeVideo))
                { (imageDataSampleBuffer, error) -> Void in
                    self.imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataSampleBuffer)
            }}
        
    }
    
}
