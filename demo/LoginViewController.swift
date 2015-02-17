//
//  LoginViewController.swift
//  demo
//
//  Created by Chris Royer on 2/16/15.
//  Copyright (c) 2015 Chris Royer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var ActivityView: UIActivityIndicatorView!
    @IBOutlet weak var SigninButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ActivityView.alpha = 0
        SigninButton.enabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func EmailEditingDidBegin(sender: AnyObject) {
    }
    
    @IBAction func EmailEditingDidChange(sender: AnyObject) {
        if (EmailTextField.text.isEmpty || PasswordTextField.text.isEmpty) {
            self.SigninButton.enabled = false
        } else {
            self.SigninButton.enabled = true
        }
    }
    
    @IBAction func PasswordEditingDidBegin(sender: AnyObject) {
    }
    
    @IBAction func PasswordEditingDidChange(sender: AnyObject) {
        if (EmailTextField.text.isEmpty || PasswordTextField.text.isEmpty) {
            self.SigninButton.enabled = false
        } else {
            self.SigninButton.enabled = true
        }
    }
    
    @IBAction func DidPressSigninButton(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.ActivityView.alpha = 1
        })
        SigninButton.selected = true
        ActivityView.startAnimating()
        
        delay(0.8, { () -> () in
            if (self.EmailTextField.text == "me@yahoo.com" && self.PasswordTextField.text == "password") {
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
                self.EmailTextField.text = ""
                self.PasswordTextField.text = ""
                self.ActivityView.stopAnimating()
                self.ActivityView.alpha = 0
                self.SigninButton.enabled = false
                self.SigninButton.selected = false
                
            }
            else {
                var alertView = UIAlertView(title: "Umm, no", message: "I told you your email is 'me@yahoo.com' and password is 'password'", delegate: nil, cancelButtonTitle: "Got it")
                alertView.show()
                self.PasswordTextField.text = ""
                self.SigninButton.selected = false
                self.SigninButton.enabled = false
                self.ActivityView.stopAnimating()
                self.ActivityView.alpha = 0
            }
        })
        
    }
    
    
    
}
