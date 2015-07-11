//
//  ThreeImagesSelectViewController.swift
//  Testing
//
//  Created by Hannah Werdmuller on 6/12/15.
//  Copyright (c) 2015 pathdigger. All rights reserved.
//

import UIKit

class ThreeImagesSelectViewController: UIViewController {

    @IBOutlet weak var textbox: UITextView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var binocs1: UIView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var binocs2: UIView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var binocs3: UIView!
    @IBOutlet weak var closeZoom: UIButton!
    @IBOutlet weak var pointsIndicator: UILabel!
    @IBOutlet weak var hideScreen: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hideScreen.setTranslatesAutoresizingMaskIntoConstraints(true)
        hideScreen.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        
        pointsThisQuestion = 0
        closeZoom.userInteractionEnabled = false
        closeZoom.alpha = 0
        closeZoom.layer.cornerRadius = 4
        
        textbox.text = "\(questionText!)"
        textbox.editable = false
        
        var imagesArray = [questionImage1, questionImage2, questionImage3]
        var shuffledImagesArray = imagesArray.shuffled()
        var centerAlignedImageX = screenWidth-imageWidth
        
        image1.image = shuffledImagesArray[0]
        image1.setTranslatesAutoresizingMaskIntoConstraints(true)
        image1.frame = CGRect(x: 23, y: 189, width: imageWidth, height: imageWidth)
        image1.layer.borderColor = UIColor.whiteColor().CGColor
        image1.layer.borderWidth = 6
        binocs1.setTranslatesAutoresizingMaskIntoConstraints(true)
        binocs1.frame = CGRect(x: image1.frame.origin.x+(imageWidth/2 - 25), y: image1.frame.origin.y-26, width: 50, height: 50)
        binocs1.layer.cornerRadius = 25
        binocs1.layer.borderColor = UIColor.whiteColor().CGColor
        binocs1.layer.borderWidth = 4
        
        image2.image = shuffledImagesArray[1]
        image2.setTranslatesAutoresizingMaskIntoConstraints(true)
        image2.frame = CGRect(x: (23+imageWidth+14), y: 189, width: imageWidth, height: imageWidth)
        image2.layer.borderColor = UIColor.whiteColor().CGColor
        image2.layer.borderWidth = 6
        binocs2.setTranslatesAutoresizingMaskIntoConstraints(true)
        binocs2.frame = CGRect(x: image2.frame.origin.x+(imageWidth/2 - 25), y: image2.frame.origin.y-26, width: 50, height: 50)
        binocs2.layer.cornerRadius = 25
        binocs2.layer.borderColor = UIColor.whiteColor().CGColor
        binocs2.layer.borderWidth = 4
        
        image3.image = shuffledImagesArray[2]
        image3.setTranslatesAutoresizingMaskIntoConstraints(true)
        image3.frame = CGRect(x: ((screenWidth/2)-(imageWidth/2)), y: (223+imageWidth), width: imageWidth, height: imageWidth)
        image3.layer.borderColor = UIColor.whiteColor().CGColor
        image3.layer.borderWidth = 6
        binocs3.setTranslatesAutoresizingMaskIntoConstraints(true)
        binocs3.frame = CGRect(x: image3.frame.origin.x+(imageWidth/2 - 25), y: image3.frame.origin.y-26, width: 50, height: 50)
        binocs3.layer.cornerRadius = 25
        binocs3.layer.borderColor = UIColor.whiteColor().CGColor
        binocs3.layer.borderWidth = 4
        
        pointsIndicator.setTranslatesAutoresizingMaskIntoConstraints(true)
        pointsIndicator.alpha = 0.0
        pointsIndicator.frame = CGRectMake((screenWidth*0.865), (screenHeight*0.6), 35, 35)
        pointsIndicator.text = ""
        pointsIndicator.textAlignment = NSTextAlignment.Center
        pointsIndicator.backgroundColor = pointsIndicatorColor
        pointsIndicator.layer.masksToBounds = true
        pointsIndicator.layer.cornerRadius = 10
        pointsIndicator.layer.borderWidth = 5
        pointsIndicator.layer.borderColor = pointsIndicatorBorderColor.CGColor
        pointsIndicator.textColor = UIColor.whiteColor()
        
        closeZoom.setTranslatesAutoresizingMaskIntoConstraints(true)
        closeZoom.userInteractionEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func binocs1Tapped(sender: UITapGestureRecognizer) {

        self.view.insertSubview(self.image1, belowSubview: self.closeZoom)
        binocs1.hidden = true
        self.binocs2.hidden = true
        self.binocs3.hidden = true
        self.image1.userInteractionEnabled = false
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
            UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 3/4, animations: {
                self.image1.frame = CGRectMake(10, 150, (screenWidth - 20), (screenWidth-20))
                self.hideScreen.backgroundColor = UIColor.blackColor()
                self.hideScreen.alpha = 0.7
                self.hideScreen.frame.size = CGSize(width: screenWidth, height: screenHeight)
            })
            UIView.addKeyframeWithRelativeStartTime(3/4, relativeDuration: 1/4, animations : {
                self.closeZoom.userInteractionEnabled = true
                self.closeZoom.frame.origin = CGPoint(x: self.image1.frame.origin.x, y: self.image1.frame.origin.y)
                self.closeZoom.alpha = 1.0

            })
        }, completion: nil)
    }
    
    @IBAction func binocs2Tapped(sender: UITapGestureRecognizer) {

        self.view.insertSubview(self.image2, belowSubview: self.closeZoom)
        binocs2.hidden = true
        self.binocs1.hidden = true
        self.binocs3.hidden = true
        self.image2.userInteractionEnabled = false
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
            UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 3/4, animations: {
                self.image2.frame = CGRectMake(10, 150, (screenWidth - 20), (screenWidth-20))
                self.hideScreen.backgroundColor = UIColor.blackColor()
                self.hideScreen.alpha = 0.7
                self.hideScreen.frame.size = CGSize(width: screenWidth, height: screenHeight)
            })
            UIView.addKeyframeWithRelativeStartTime(3/4, relativeDuration: 1/4, animations : {
                self.closeZoom.userInteractionEnabled = true
                self.closeZoom.frame.origin = CGPoint(x: self.image2.frame.origin.x, y: self.image2.frame.origin.y)
                self.closeZoom.alpha = 1.0
            })
        }, completion: nil)
    }
    
    @IBAction func binocs3Tapped(sender: UITapGestureRecognizer) {

        self.view.insertSubview(self.image3, belowSubview: self.closeZoom)
        binocs3.hidden = true
        self.binocs1.hidden = true
        self.binocs2.hidden = true
        self.image3.userInteractionEnabled = false
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
            UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 3/4, animations: {
                self.image3.frame = CGRectMake(10, 150, (screenWidth - 20), (screenWidth-20))
                self.hideScreen.backgroundColor = UIColor.blackColor()
                self.hideScreen.alpha = 0.7
                self.hideScreen.frame.size = CGSize(width: screenWidth, height: screenHeight)
            })
            UIView.addKeyframeWithRelativeStartTime(3/4, relativeDuration: 1/4, animations : {
                self.closeZoom.frame.origin = CGPoint(x: self.image3.frame.origin.x, y: self.image3.frame.origin.y)
                self.closeZoom.alpha = 1.0
                self.closeZoom.userInteractionEnabled = true
            })
        }, completion: nil)
    }

    @IBAction func closeZoomClicked(sender: UIButton) {
    
        UIView.animateKeyframesWithDuration(0.5, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
            UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 1/4, animations: {
                self.closeZoom.alpha = 0.0
            })
            UIView.addKeyframeWithRelativeStartTime(2/4, relativeDuration: 2/4, animations: {
                self.image1.frame = CGRect(x: 23, y: 189, width: imageWidth, height: imageWidth)
                self.image2.frame = CGRect(x: (23+imageWidth+14), y: 189, width: imageWidth, height: imageWidth)
                self.image3.frame = CGRect(x: ((screenWidth/2)-(imageWidth/2)), y: (223+imageWidth), width: imageWidth, height: imageWidth)
            })
            UIView.addKeyframeWithRelativeStartTime(3/4, relativeDuration: 1/4, animations: {
                self.binocs1.hidden = false
                self.binocs2.hidden = false
                self.binocs3.hidden = false
                self.closeZoom.userInteractionEnabled = false
                self.image3.userInteractionEnabled = true
                self.image2.userInteractionEnabled = true
                self.image1.userInteractionEnabled = true
                
                if self.image1.frame.width == imageWidth && self.image2.frame.width == imageWidth && self.image3.frame.width == imageWidth {
                    self.hideScreen.alpha = 0.0
                } else {
                    self.hideScreen.alpha = 0.7
                }
            })
        }, completion:  nil)
    }

    
    @IBAction func image1Tapped(sender: UITapGestureRecognizer) {
        
        self.image1.userInteractionEnabled = false
        self.image2.userInteractionEnabled = false
        self.image3.userInteractionEnabled = false
        
        textbox.text = "\(textAfterSelect)"
        
        if image1.image == UIImage(named: correctAnswer) {
            UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.image1.layer.borderColor = borderGreenColor.CGColor
                pointsThisQuestion = pointsAvailableThisQuestion
                self.binocs1.layer.backgroundColor = correctGreenColor.CGColor
                self.binocs1.layer.borderColor = borderGreenColor.CGColor
            }, completion: nil)
            
            UIView.animateKeyframesWithDuration(2.0, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
                UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 1/4, animations: {
                    self.pointsIndicator.text = "+\(pointsThisQuestion)"
                    self.pointsIndicator.alpha = 1.0
                    self.pointsIndicator.frame.origin = CGPoint(x: (screenWidth*0.85), y: (screenHeight*0.5))
                    
                })
                UIView.addKeyframeWithRelativeStartTime(2/4, relativeDuration: 3/4, animations: {
                    self.pointsIndicator.alpha = 0.0
                    self.pointsIndicator.frame.origin = CGPoint(x: (screenWidth*0.85), y: (screenHeight*0.3))
                })
            }, completion: nil)
        } else {
            UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.image1.layer.borderColor = borderRedColor.CGColor
                self.binocs1.layer.backgroundColor = wrongRedColor.CGColor
                self.binocs1.layer.borderColor = borderRedColor.CGColor
            }, completion: nil)
        }
    }
    
    @IBAction func image2Tapped(sender: UITapGestureRecognizer) {
        
        self.image1.userInteractionEnabled = false
        self.image2.userInteractionEnabled = false
        self.image3.userInteractionEnabled = false
        
        textbox.text = "\(textAfterSelect)"
        
        if image2.image == UIImage(named: correctAnswer) {
            UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.image2.layer.borderColor = borderGreenColor.CGColor
                pointsThisQuestion = pointsAvailableThisQuestion
                self.binocs2.layer.backgroundColor = correctGreenColor.CGColor
                self.binocs2.layer.borderColor = borderGreenColor.CGColor
                }, completion: nil)
            
            UIView.animateKeyframesWithDuration(2.0, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
                UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 1/4, animations: {
                    self.pointsIndicator.text = "+\(pointsThisQuestion)"
                    self.pointsIndicator.alpha = 1.0
                    self.pointsIndicator.frame.origin = CGPoint(x: (screenWidth*0.85), y: (screenHeight*0.5))
                    
                })
                UIView.addKeyframeWithRelativeStartTime(2/4, relativeDuration: 3/4, animations: {
                    self.pointsIndicator.alpha = 0.0
                    self.pointsIndicator.frame.origin = CGPoint(x: (screenWidth*0.85), y: (screenHeight*0.3))
                })
            }, completion: nil)
        } else {
            UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.image2.layer.borderColor = borderRedColor.CGColor
                self.binocs2.layer.backgroundColor = wrongRedColor.CGColor
                self.binocs2.layer.borderColor = borderRedColor.CGColor
            }, completion: nil)
        }
    }
    
    @IBAction func image3Tapped(sender: UITapGestureRecognizer) {
        
        self.image1.userInteractionEnabled = false
        self.image2.userInteractionEnabled = false
        self.image3.userInteractionEnabled = false
        
        textbox.text = "\(textAfterSelect)"
        
        if image3.image == UIImage(named: correctAnswer) {
            UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.image3.layer.borderColor = borderGreenColor.CGColor
                pointsThisQuestion = pointsAvailableThisQuestion
                self.binocs3.layer.backgroundColor = correctGreenColor.CGColor
                self.binocs3.layer.borderColor = borderGreenColor.CGColor
                }, completion: nil)
            
            UIView.animateKeyframesWithDuration(2.0, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
                UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 1/4, animations: {
                    self.pointsIndicator.text = "+\(pointsThisQuestion)"
                    self.pointsIndicator.alpha = 1.0
                    self.pointsIndicator.frame.origin = CGPoint(x: (screenWidth*0.85), y: (screenHeight*0.5))
                    
                })
                UIView.addKeyframeWithRelativeStartTime(2/4, relativeDuration: 3/4, animations: {
                    self.pointsIndicator.alpha = 0.0
                    self.pointsIndicator.frame.origin = CGPoint(x: (screenWidth*0.85), y: (screenHeight*0.3))
                })
                }, completion: nil)
        } else {
            UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.image3.layer.borderColor = borderRedColor.CGColor
                self.binocs3.layer.backgroundColor = wrongRedColor.CGColor
                self.binocs3.layer.borderColor = borderRedColor.CGColor
            }, completion: nil)
        }
    }
}

private var imageWidth : CGFloat = (screenWidth-((23*2)+14))/2



