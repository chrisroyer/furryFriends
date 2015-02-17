//
//  RabbitViewController.swift
//  demo
//
//  Created by Chris Royer on 2/10/15.
//  Copyright (c) 2015 Chris Royer. All rights reserved.
//

import UIKit

class RabbitViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate, UIActionSheetDelegate {


    @IBOutlet var RabbitTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var RabbitView: UIImageView!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var FieldView: UIImageView!
    @IBOutlet weak var ChatBubbleView: UIView!
    @IBOutlet weak var AnswerLabel: UILabel!
    @IBOutlet weak var QuestionField: UITextField!
    @IBOutlet weak var AskButton: UIButton!
    @IBOutlet weak var ActivityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var LogoutButton: UIButton!
    var scale: CGFloat! = 1
    var rotation: CGFloat! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScrollView.delegate = self
        AskButton.enabled = false
        ChatBubbleView.alpha = 0
        ActivityIndicatorView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Game Controls
    
    @IBAction func didPressUpButton(sender: AnyObject) {
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.RabbitView.center.y = self.RabbitView.center.y - 10
            }) { (Bool) -> Void in
        }
    }
    
    @IBAction func didPressRightButton(sender: AnyObject) {
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.RabbitView.center.x = self.RabbitView.center.x + 10
            }) { (Bool) -> Void in
        }
    }
    
    @IBAction func didPressDownButton(sender: AnyObject) {
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.RabbitView.center.y = self.RabbitView.center.y + 10
            }) { (Bool) -> Void in
        }
    }
    
    @IBAction func didPressLeftButton(sender: AnyObject) {
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.RabbitView.center.x = self.RabbitView.center.x - 10
            }) { (Bool) -> Void in
        }
    }
    
    @IBAction func didPressHideButton(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.RabbitView.transform = CGAffineTransformMakeScale(0.1, 0.1)
            self.RabbitView.alpha = 0
        })
    }
    
    @IBAction func didPressShowButton(sender: AnyObject) {
        var rotateTrasnform = self.CGAffineTransformMakeDegreeRotation(self.rotation)
        var scaleTransform = CGAffineTransformMakeScale(self.scale, self.scale)
        var transform = CGAffineTransformConcat(rotateTrasnform, scaleTransform)
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.RabbitView.alpha = 1
            self.RabbitView.transform = transform
        })
    }
    
    func CGAffineTransformMakeDegreeRotation(rotation: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeRotation(rotation * CGFloat(M_PI / 180))
    }
    
    @IBAction func didPressRotateLeftButton(sender: AnyObject) {
        rotation = rotation - 15
        var rotateTrasnform = self.CGAffineTransformMakeDegreeRotation(self.rotation)
        var scaleTransform = CGAffineTransformMakeScale(self.scale, self.scale)
        var transform = CGAffineTransformConcat(rotateTrasnform, scaleTransform)
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.RabbitView.transform = transform
        })
    }
    
    @IBAction func didPressRotateRightButton(sender: AnyObject) {
        rotation = rotation + 15
        var rotateTrasnform = self.CGAffineTransformMakeDegreeRotation(self.rotation)
        var scaleTransform = CGAffineTransformMakeScale(self.scale, self.scale)
        var transform = CGAffineTransformConcat(rotateTrasnform, scaleTransform)
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.RabbitView.transform = transform
        })
    }
    
    @IBAction func didPressLeafButton(sender: AnyObject) {
        scale = scale + 0.25
        var rotateTrasnform = self.CGAffineTransformMakeDegreeRotation(self.rotation)
        var scaleTransform = CGAffineTransformMakeScale(self.scale, self.scale)
        var transform = CGAffineTransformConcat(rotateTrasnform, scaleTransform)
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.RabbitView.transform = transform
        })
    }
    
    @IBAction func didPressTearButton(sender: AnyObject) {
        scale = scale - 0.25
        var rotateTrasnform = self.CGAffineTransformMakeDegreeRotation(self.rotation)
        var scaleTransform = CGAffineTransformMakeScale(self.scale, self.scale)
        var transform = CGAffineTransformConcat(rotateTrasnform, scaleTransform)
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.RabbitView.transform = transform
        })
    }
    
    @IBAction func didPressResetButton(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.RabbitView.center = CGPointMake(160, 285)
            self.RabbitView.transform = CGAffineTransformMakeScale(1, 1)
            self.RabbitView.alpha = 1
            self.rotation = 0
            self.scale = 1
        })
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.ChatBubbleView.alpha = 0
        })
    }
    
    @IBAction func didTapField(sender: UITapGestureRecognizer) {
        var point = RabbitTapGestureRecognizer.locationInView(view)
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.RabbitView.center = point
            }) { (Bool) -> Void in
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var yOffset = ScrollView.contentOffset.y
        FieldView.frame.origin.y = yOffset / 5
    }
    
    
    // MARK: - Ask Questions
    
    @IBAction func questionEditingDidBegin(sender: AnyObject) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.RabbitView.center = CGPointMake(160, 250)
            self.RabbitView.transform = CGAffineTransformMakeScale(1, 1)
            self.RabbitView.alpha = 1
            self.rotation = 0
            self.scale = 1
        })
    }
    
    @IBAction func questionEditingDidChange(sender: AnyObject) {
        if (QuestionField.text.isEmpty) {AskButton.enabled = false}
        else {AskButton.enabled = true}
    }
    
    @IBAction func didPressAskButton(sender: AnyObject) {
        AnswerLabel.alpha = 0
        ChatBubbleView.alpha = 1
        ActivityIndicatorView.hidden = false
        ActivityIndicatorView.startAnimating()
        delay(0.8, { () -> () in
            self.AnswerLabel.alpha = 1
            self.ActivityIndicatorView.hidden = true
            self.ActivityIndicatorView.stopAnimating()
            if (self.QuestionField.text == "What is your name?") {
                self.AnswerLabel.text = "There are some who call me 'RabbitView'"
            } else if (self.QuestionField.text == "Will you be my friend?") {
                self.AnswerLabel.text = "Let me consult the Magic 8 Ball"
            } else {
                self.AnswerLabel.text = "¿No Comprende?"
            }
            self.AskButton.enabled = false
        })
        QuestionField.text = ""
    }

    // MARK: - Logout
    
    @IBAction func DidPressLogoutButton(sender: AnyObject) {
        
        var actionSheetView = UIActionSheet(title: "Logout?", delegate: self, cancelButtonTitle: "No, thanks", destructiveButtonTitle: "Get me outta here")
        actionSheetView.showInView(view)
    }
    
    func actionSheet(actionSheet: UIActionSheet,
        clickedButtonAtIndex buttonIndex: Int) {
        if (buttonIndex == 0) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

}






