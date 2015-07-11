//
//  FuckingWorkAlreadyViewController.swift
//  Testing
//
//  Created by Hannah Werdmuller on 6/19/15.
//  Copyright (c) 2015 pathdigger. All rights reserved.
//

import UIKit

class FuckingWorkAlreadyViewController: UIViewController {

    @IBOutlet weak var ohGod: UITextView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var correctButton: UIButton
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pointsThisQuestion = 0
        
        var buttonTextArray = [label1Text, label2Text, label3Text, label4Text]
        var shuffledButtonTextArray = buttonTextArray.shuffled()
        
        ohGod.text = "\(questionText!)"
        ohGod.editable = false
        
        button1.text = shuffledButtonTextArray[0]
        button1.backgroundColor = fillGrayColor
        button1.layer.masksToBounds = true
        button1.layer.cornerRadius = 10
        button1.layer.borderWidth = 2
        button1.layer.borderColor = borderGrayColor.CGColor
        
        button2.text = shuffledButtonTextArray[1]
        button2.backgroundColor = fillGrayColor
        button2.layer.masksToBounds = true
        button2.layer.cornerRadius = 10
        button2.layer.borderWidth = 2
        button2.layer.borderColor = borderGrayColor.CGColor
        
        button3.text = shuffledButtonTextArray[2]
        button3.backgroundColor = fillGrayColor
        button3.layer.masksToBounds = true
        button3.layer.cornerRadius = 10
        button3.layer.borderWidth = 2
        button3.layer.borderColor = borderGrayColor.CGColor
        
        button4.text = shuffledButtonTextArray[3]
        button4.backgroundColor = fillGrayColor
        button4.layer.masksToBounds = true
        button4.layer.cornerRadius = 10
        button4.layer.borderWidth = 2
        button4.layer.borderColor = borderGrayColor.CGColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    if button1.text == correctAnswer {
        var correctButton = button1
    } else if button2.text == correctAnswer {
        var correctButton = button2
    } else if button3.text == correctAnswer {
        var correctButton = button3
    } else {
        var correctButton = button4
    }
    
    @IBAction func button1Pressed(sender: UIButton) {
    
        self.button1.userInteractionEnabled = false
        self.button2.userInteractionEnabled = false
        self.button3.userInteractionEnabled = false
        self.button4.userInteractionEnabled = false
        
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.correctButton.layer.borderColor = borderGreenColor.CGColor
            self.correctButton.layer.backgroundColor = correctGreenColor.CGColor
            self.correctButton.textColor = UIColor.whiteColor()
            }, completion: nil)
        
        if correctButton == button1 {
            pointsThisQuestion = pointsAvailableThisQuestion
        } else {
            self.button1.
        }
            
            
        }
    }
    
    @IBAction func button2Pressed(sender: UIButton) {
    }
    
    @IBAction func button3Pressed(sender: UIButton) {
    }
    
    @IBAction func button4Pressed(sender: UIButton) {
    }
    
    
}
