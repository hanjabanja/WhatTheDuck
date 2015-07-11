//
//  TwoImagesSelect.swift
//  Testing
//
//  Created by Hannah Werdmuller on 6/4/15.
//  Copyright (c) 2015 pathdigger. All rights reserved.
//

import UIKit

class TwoImagesSelectViewController: UIViewController {

    @IBOutlet weak var textbox: UITextView!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet var tapBinocs1: UITapGestureRecognizer!
    @IBOutlet var tapImage1: UITapGestureRecognizer!
    
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet var tapBinocs2: UITapGestureRecognizer!
    @IBOutlet var tapImage2: UITapGestureRecognizer!
    
    @IBOutlet weak var pointsIndicator: UILabel!
    
    @IBOutlet weak var binocImageView: UIImageView!
    @IBOutlet weak var binocFrame: UIView!
    @IBOutlet weak var binocView2: UIView!
    
    @IBOutlet weak var closeZoom: UIButton!
    @IBOutlet weak var closeZoom2: UIButton!
    
    @IBOutlet weak var hideScreen: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideScreen.alpha = 0
        pointsThisQuestion = 0
        closeZoom.userInteractionEnabled = false
        closeZoom.alpha = 0
        closeZoom.layer.cornerRadius = 4
        closeZoom2.userInteractionEnabled = false
        closeZoom2.alpha = 0
        closeZoom2.layer.cornerRadius = 4

        textbox.text = "\(questionText!)"
        textbox.editable = false
        
        var imagesArray = [questionImage1, questionImage2]
        var shuffledImagesArray = imagesArray.shuffled()
        
        image1.image = shuffledImagesArray[0]
        image1.layer.borderColor = UIColor.whiteColor().CGColor
        image1.layer.borderWidth = 6
        var image1Frame = image1.frame
        binocFrame.layer.cornerRadius = 25
        binocFrame.layer.borderColor = UIColor.whiteColor().CGColor
        binocFrame.layer.borderWidth = 4
        
        image2.image = shuffledImagesArray[1]
        image2.layer.borderColor = UIColor.whiteColor().CGColor
        image2.layer.borderWidth = 6
        var image2Frame = image2.frame
        binocView2.layer.cornerRadius = 25
        binocView2.layer.borderColor = UIColor.whiteColor().CGColor
        binocView2.layer.borderWidth = 4
        
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

        closeZoom.userInteractionEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    @IBAction func binocsTopTapped(sender: UITapGestureRecognizer) {
        
        binocFrame.hidden = true
//        binocFrame.alpha = 0.0
        self.image1.userInteractionEnabled = false
        self.image2.userInteractionEnabled = false
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
            UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 3/4, animations: {
                self.image1.frame = CGRectMake(10, 120, (screenWidth - 20), (screenWidth-20)*(7/11))
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
    @IBAction func closeZoomClicked(sender: UIButton) {
    
        UIView.animateKeyframesWithDuration(0.5, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
            UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 1/4, animations: {
                self.closeZoom.alpha = 0.0
            })
            UIView.addKeyframeWithRelativeStartTime(2/4, relativeDuration: 2/4, animations: {
            self.image1.frame = CGRect(x: 50, y: 204, width: imageWidth, height: imageHeight)
            })
            UIView.addKeyframeWithRelativeStartTime(3/4, relativeDuration: 1/4, animations: {
                self.binocFrame.hidden = false
                self.binocFrame.alpha = 1.0
                self.closeZoom.userInteractionEnabled = false
                self.image1.userInteractionEnabled = true
                self.image2.userInteractionEnabled = true
                
                if self.image2.frame.width == screenWidth-100 {
                    self.hideScreen.alpha = 0.0
                } else {
                    self.hideScreen.alpha = 0.7
                }
            })
        }, completion: nil)
    }

    @IBAction func binocsBottomTapped(sender: UITapGestureRecognizer) {
        
        binocView2.hidden = true
        binocView2.alpha = 0.0
        self.image1.userInteractionEnabled = false
        self.image2.userInteractionEnabled = false
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
            UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 3/4, animations: {
                self.image2.frame = CGRectMake(10, 332, (screenWidth - 20), (screenWidth-20)*(7/11))
                self.hideScreen.backgroundColor = UIColor.blackColor()
                self.hideScreen.alpha = 0.7
                self.hideScreen.frame.size = CGSize(width: screenWidth, height: screenHeight)
            })
            UIView.addKeyframeWithRelativeStartTime(3/4, relativeDuration: 1/4, animations : {
                self.closeZoom2.userInteractionEnabled = true
                self.closeZoom2.frame.origin = CGPoint(x: self.image2.frame.origin.x, y: self.image2.frame.origin.y)
                self.closeZoom2.alpha = 1.0
            })
        }, completion: nil)
    }
    
    @IBAction func closeZoom2Clicked(sender: UIButton) {
        UIView.animateKeyframesWithDuration(0.5, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
            UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 1/4, animations: {
                self.closeZoom2.alpha = 0.0
            })
            UIView.addKeyframeWithRelativeStartTime(2/4, relativeDuration: 2/4, animations: {
                self.image2.frame = CGRect(x: 50, y: 362, width: imageWidth, height: imageHeight)
            })
            UIView.addKeyframeWithRelativeStartTime(3/4, relativeDuration: 1/4, animations: {
                self.binocView2.hidden = false
                self.binocView2.alpha = 1.0
                self.closeZoom2.userInteractionEnabled = false
                self.image2.userInteractionEnabled = true
                self.image1.userInteractionEnabled = true
                
                if self.image1.frame.width == screenWidth-100 {
                    self.hideScreen.alpha = 0.0
                } else {
                    self.hideScreen.alpha = 0.7
                }
            })
        }, completion: nil)
    }
    
    @IBAction func image1Tapped(sender: UITapGestureRecognizer) {
    
        self.image1.userInteractionEnabled = false
        self.image2.userInteractionEnabled = false
        
        textbox.text = "\(textAfterSelect)"
        
        if image1.image == UIImage(named: correctAnswer) {
            UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.image1.layer.borderColor = borderGreenColor.CGColor
                pointsThisQuestion = pointsAvailableThisQuestion
                self.binocFrame.layer.backgroundColor = correctGreenColor.CGColor
                self.binocFrame.layer.borderColor = borderGreenColor.CGColor
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
                self.binocFrame.layer.backgroundColor = wrongRedColor.CGColor
                self.binocFrame.layer.borderColor = borderRedColor.CGColor
            }, completion: nil)
        }
    }

    
    
    @IBAction func tappedBottomImage(sender: UITapGestureRecognizer) {
        
        self.image1.userInteractionEnabled = false
        self.image2.userInteractionEnabled = false
        
        textbox.text = "\(textAfterSelect)"
        
        if image2.image == UIImage(named: correctAnswer) {
            UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.image2.layer.borderColor = borderGreenColor.CGColor
                pointsThisQuestion = pointsAvailableThisQuestion
                self.binocView2.layer.backgroundColor = correctGreenColor.CGColor
                self.binocView2.layer.borderColor = borderGreenColor.CGColor
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
                self.binocView2.layer.backgroundColor = wrongRedColor.CGColor
                self.binocView2.layer.borderColor = borderRedColor.CGColor
                }, completion: nil)
        }
    }
}

var correctAnswer = questionsLibrary[index]["correct"] as! String!
var pointsAvailableThisQuestion = questionsLibrary[index]["level"] as! Int!
var textAfterSelect = questionsLibrary[index]["textAfterSelect"] as! String!

private var imageWidth = screenWidth - 100
private var imageHeight = imageWidth * (7/11)

var imageLabelX = ((50 + imageWidth) - 30)
var image1LabelY = (184 + (imageHeight / 2) - 30)
var image2LabelY = image1LabelY + imageHeight + 18

var binocImage = UIImage(named: "binoculars")

extension Array {
    func shuffled() -> [T] {
        var list = self
        for i in 0..<(list.count - 1) {
            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
            swap(&list[i], &list[j])
        }
        return list
    }
}



