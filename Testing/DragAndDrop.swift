//
//  ViewController.swift
//  Testing
//
//  Created by Hannah Werdmuller on 5/26/15.
//  Copyright (c) 2015 pathdigger. All rights reserved.
//

import UIKit

class DragAndDropViewController: UIViewController { //1
    
    @IBOutlet weak var textbox: UITextView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet var swipeToShuffle: UISwipeGestureRecognizer!
    @IBOutlet weak var pointsIndicator: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    pointsThisQuestion = 0
        
    submitButton.alpha = 0.0
    submitButton.enabled = false
        
    questionImage.image = questionImage1
    
    textbox.text = "\(questionText!) \(beforeSwipeText)"
    textbox.editable = false
        
    label1.setTranslatesAutoresizingMaskIntoConstraints(true)
    label1.frame = CGRectMake(label1xNew, label1yNew, labelwidth, labelheight)
    label1.text = label1Text as! String!
    label1.textAlignment = NSTextAlignment.Center
    label1.backgroundColor = fillGrayColor
    label1.layer.masksToBounds = true
    label1.layer.cornerRadius = 10
    label1.layer.borderWidth = 2
    label1.layer.borderColor = borderGrayColor.CGColor
        
    label2.setTranslatesAutoresizingMaskIntoConstraints(true)
    label2.frame = CGRectMake(label2xNew, label2yNew, labelwidth, labelheight)
    label2.text = label2Text as! String!
    label2.textAlignment = NSTextAlignment.Center
    label2.backgroundColor = fillGrayColor
    label2.layer.masksToBounds = true
    label2.layer.cornerRadius = 10
    label2.layer.borderWidth = 2
    label2.layer.borderColor = borderGrayColor.CGColor

    label3.setTranslatesAutoresizingMaskIntoConstraints(true)
    label3.frame = CGRectMake(label3xNew, label3yNew, labelwidth, labelheight)
    label3.text = label3Text as! String!
    label3.textAlignment = NSTextAlignment.Center
    label3.backgroundColor = fillGrayColor
    label3.layer.masksToBounds = true
    label3.layer.cornerRadius = 10
    label3.layer.borderWidth = 2
    label3.layer.borderColor = borderGrayColor.CGColor
        
    label4.setTranslatesAutoresizingMaskIntoConstraints(true)
    label4.frame = CGRectMake(label4xNew, label4yNew, labelwidth, labelheight)
    label4.text = label4Text as! String!
    label4.textAlignment = NSTextAlignment.Center
    label4.backgroundColor = fillGrayColor
    label4.layer.masksToBounds = true
    label4.layer.cornerRadius = 10
    label4.layer.borderWidth = 2
    label4.layer.borderColor = borderGrayColor.CGColor
    
    pointsIndicator.setTranslatesAutoresizingMaskIntoConstraints(true)
    pointsIndicator.alpha = 0.0
    pointsIndicator.frame = CGRectMake((screenWidth*0.85), (screenHeight*0.6), 35, 35)
    pointsIndicator.text = ""
    pointsIndicator.textAlignment = NSTextAlignment.Center
    pointsIndicator.backgroundColor = pointsIndicatorColor
    pointsIndicator.layer.masksToBounds = true
    pointsIndicator.layer.cornerRadius = 10
    pointsIndicator.layer.borderWidth = 5
    pointsIndicator.layer.borderColor = pointsIndicatorBorderColor.CGColor
    pointsIndicator.textColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shuffleLabelsAfterSwipe(sender: UISwipeGestureRecognizer) { //2
        UIView.animateKeyframesWithDuration(1.5, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: {
        UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 1/4, animations: {
            self.textbox.text = "\(questionText!)"
            self.label1.alpha = 0.0
            self.label2.alpha = 0.0
            self.label3.alpha = 0.0
            self.label4.alpha = 0.0
        })
        UIView.addKeyframeWithRelativeStartTime(2/4, relativeDuration: 1/8, animations: {
            self.label1.frame.origin = CGPoint(x: labelShuffleX1, y: (390*imageScaleFactor))
            self.label2.frame.origin = CGPoint(x: labelShuffleX2, y: (390*imageScaleFactor))
            self.label3.frame.origin = CGPoint(x: labelShuffleX1, y: (440*imageScaleFactor))
            self.label4.frame.origin = CGPoint(x: labelShuffleX2, y: (440*imageScaleFactor))
        })
        UIView.addKeyframeWithRelativeStartTime(3/4, relativeDuration: 1/4, animations: {
            self.label1.alpha = 1.0
            self.label2.alpha = 1.0
            self.label3.alpha = 1.0
            self.label4.alpha = 1.0
            self.submitButton.alpha = 1.0
            self.textbox.text = "\(questionText!) \(beforeSelectText!)"
            self.label1.userInteractionEnabled = true
            self.label2.userInteractionEnabled = true
            self.label3.userInteractionEnabled = true
            self.label4.userInteractionEnabled = true
            self.submitButton.enabled = true
            self.swipeToShuffle.enabled = false
        })
        }, completion: nil)
    }
    @IBAction func label3Drag(sender: UIPanGestureRecognizer) {
        if sender.state != .Ended && sender.state != .Failed {
            let location = sender.locationInView(sender.view!.superview!)
            sender.view!.center = location
            }
        }

    @IBAction func submitPressed(sender: UIButton) {//2
        self.submitButton.userInteractionEnabled = false
        self.label1.userInteractionEnabled = false
        self.label2.userInteractionEnabled = false
        self.label3.userInteractionEnabled = false
        self.label4.userInteractionEnabled = false
        
        var label1LandingPad = CGRectMake((label1xNew-(labelwidth/4)), (label1yNew-(labelwidth/2)), (labelwidth * 1.5), (labelwidth * 2.25))
        var label2LandingPad = CGRectMake((label2xNew-(labelwidth/4)), (label2yNew-(labelwidth/2)), (labelwidth * 1.5), (labelwidth * 2.25))
        var label3LandingPad = CGRectMake((label3xNew-(labelwidth/4)), (label3yNew-(labelwidth/2)), (labelwidth * 1.5), (labelwidth * 2.25))
        var label4LandingPad = CGRectMake((label4xNew-(labelwidth/4)), (label4yNew-(labelwidth/2)), (labelwidth * 1.5), (labelwidth * 2.25))

        if CGRectContainsPoint(label1LandingPad, label1.center) {
            label1.backgroundColor = correctGreenColor
            label1.layer.borderColor = borderGreenColor.CGColor
            label1.textColor = UIColor.whiteColor()
            pointsThisQuestion = pointsThisQuestion+1
        } else {
            label1.backgroundColor = wrongRedColor
            label1.layer.borderColor = borderRedColor.CGColor
            label1.textColor = UIColor.whiteColor()
        }
    
        if CGRectContainsPoint(label2LandingPad, label2.center) {
            label2.backgroundColor = correctGreenColor
            label2.layer.borderColor = borderGreenColor.CGColor
            label2.textColor = UIColor.whiteColor()
            pointsThisQuestion = pointsThisQuestion+1
        } else {
            label2.backgroundColor = wrongRedColor
            label2.layer.borderColor = borderRedColor.CGColor
            label2.textColor = UIColor.whiteColor()
            label1.textColor = UIColor.whiteColor()
        }
        
        if CGRectContainsPoint(label3LandingPad, label3.center) {
            label3.backgroundColor = correctGreenColor
            label3.layer.borderColor = borderGreenColor.CGColor
            label3.textColor = UIColor.whiteColor()
            pointsThisQuestion = pointsThisQuestion+1
        } else {
            label3.backgroundColor = wrongRedColor
            label3.layer.borderColor = borderRedColor.CGColor
            label3.textColor = UIColor.whiteColor()
            label1.textColor = UIColor.whiteColor()
        }
        
        if CGRectContainsPoint(label4LandingPad, label4.center) {
            label4.backgroundColor = correctGreenColor
            label4.layer.borderColor = borderGreenColor.CGColor
            label4.textColor = UIColor.whiteColor()
            pointsThisQuestion = pointsThisQuestion+1
        } else {
            label4.backgroundColor = wrongRedColor
            label4.layer.borderColor = borderRedColor.CGColor
            label4.textColor = UIColor.whiteColor()
            label1.textColor = UIColor.whiteColor()
        }
    
        UIView.animateKeyframesWithDuration(2.0, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
        UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 1/4, animations: {
            self.pointsIndicator.text = "+\(pointsThisQuestion)"
            self.pointsIndicator.alpha = 1.0
            self.pointsIndicator.frame.origin = CGPoint(x: (screenWidth*0.85), y: (screenHeight*0.5))
            self.label1.frame = CGRectMake(label1xNew, label1yNew, labelwidth, labelheight)
            self.label2.frame = CGRectMake(label2xNew, label2yNew, labelwidth, labelheight)
            self.label3.frame = CGRectMake(label3xNew, label3yNew, labelwidth, labelheight)
            self.label4.frame = CGRectMake(label4xNew, label4yNew, labelwidth, labelheight)
            
        })
        UIView.addKeyframeWithRelativeStartTime(2/4, relativeDuration: 3/4, animations: {
            self.pointsIndicator.alpha = 0.0
            self.pointsIndicator.frame.origin = CGPoint(x: (screenWidth*0.85), y: (screenHeight*0.3))
            })
        }, completion: nil)
    }
}

var index = 2
var questionsLibrary = Questions().library
var questionText = questionsLibrary[index]["text"]

var pointsThisQuestion = 0

var screenWidth = UIScreen.mainScreen().bounds.width
var screenHeight = UIScreen.mainScreen().bounds.height
private var imageWidth = screenWidth - 30
var imageScaleFactor = imageWidth / 290

var labelheight = questionsLibrary[index]["labelheight"] as! CGFloat
var labelwidth = questionsLibrary[index]["labelwidth"] as! CGFloat
private var labelShuffleX1 = ((screenWidth / 4) - (labelwidth / 2)) as CGFloat
private var labelShuffleX2 = (((screenWidth / 4) * 3) - (labelwidth / 2)) as CGFloat

func getLabelX(xValue: CGFloat, scaleFactor: CGFloat) -> CGFloat {
    return ((xValue - 15) * scaleFactor) + 15
}
func getLabelY(yValue: CGFloat, scaleFactor: CGFloat) -> CGFloat {
    return ((yValue - 125) * scaleFactor) + 125
}

var imageName = questionsLibrary[index]["image"] as! String!
var questionImage1 = UIImage(named: imageName)
var image2Name = questionsLibrary[index]["image2"] as! String!
var questionImage2 = UIImage(named: image2Name)
var image3Name = questionsLibrary[index]["image3"] as! String!
var questionImage3 = UIImage(named: image3Name)

var label1Text = questionsLibrary[index]["label1title"]
var label1x = questionsLibrary[index]["label1x"] as! CGFloat
var label1y = questionsLibrary[index]["label1y"] as! CGFloat
var label1xNew = getLabelX(label1x, imageScaleFactor)
var label1yNew = getLabelY(label1y, imageScaleFactor)

var label2Text = questionsLibrary[index]["label2title"]
var label2x = questionsLibrary[index]["label2x"] as! CGFloat
var label2y = questionsLibrary[index]["label2y"] as! CGFloat
var label2xNew = getLabelX(label2x, imageScaleFactor)
var label2yNew = getLabelY(label2y, imageScaleFactor)

var label3Text = questionsLibrary[index]["label3title"]
var label3x = questionsLibrary[index]["label3x"] as! CGFloat
var label3y = questionsLibrary[index]["label3y"] as! CGFloat
var label3xNew = getLabelX(label3x, imageScaleFactor)
var label3yNew = getLabelY(label3y, imageScaleFactor)

var label4Text = questionsLibrary[index]["label4title"]
var label4x = questionsLibrary[index]["label4x"] as! CGFloat
var label4y = questionsLibrary[index]["label4y"] as! CGFloat
var label4xNew = getLabelX(label4x, imageScaleFactor)
var label4yNew = getLabelY(label4y, imageScaleFactor)

private var beforeSwipeText = "Study the diagram, then swipe left to continue."
var beforeSelectText = questionsLibrary[index]["beforeSelectText"] // after beforeSwipeText, before afterSelectText

var borderGrayColor : UIColor = UIColor(red: (117/255), green: (118/255), blue: (121/255), alpha: 1.0)
var fillGrayColor : UIColor = UIColor(red: (188/255), green: (190/255), blue: (192/255), alpha: 1.0)
var correctGreenColor : UIColor = UIColor(red: (121/255), green: (188/255), blue: (67/255), alpha: 1.0)
var borderGreenColor : UIColor = UIColor(red: (179/255), green: (201/255), blue: (53/255), alpha: 1.0)
var wrongRedColor : UIColor = UIColor(red: (212/255), green: (65/255), blue: (59/255), alpha: 1.0)
var borderRedColor : UIColor = UIColor(red: (176/255), green: (64/255), blue: (46/255), alpha: 1.0)
var pointsIndicatorColor : UIColor = UIColor(red: (32/255), green: (196/255), blue: (244/255), alpha: 1.0)
var pointsIndicatorBorderColor : UIColor = UIColor(red: (179/228), green: (228/255), blue: (250/255), alpha: 1.0)

// NB: image width in Interface Builder is 258.


