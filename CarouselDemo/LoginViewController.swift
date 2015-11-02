//
//  LoginViewController.swift
//  CarouselDemo
//
//  Created by Cody Evol on 11/1/15.
//  Copyright © 2015 Cody Evol. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    let alertController = UIAlertController(title: "Oops!", message: "Enter your email and password", preferredStyle: .Alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            scrollView.delegate = self
        
            scrollView.contentSize = CGSize(width: 320, height: 600)
        
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    // The main view is about to appear...
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    // The main view appeared...
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }
    
    // The keyboard is about to be shown...
    func keyboardWillShow(notification: NSNotification) {
        // Move the button up above keyboard
        buttonParentView.transform = CGAffineTransformMakeTranslation(0, -90)
        // Calculate the maximum scrollview content Offset y
        let maxContentOffsetY = scrollView.contentSize.height - scrollView.frame.size.height
        // Scroll the scrollview up to the maximum contentOffset
        scrollView.contentOffset.y = maxContentOffsetY
        // Enable scrolling while keyboard is shown
        scrollView.scrollEnabled = true
    }
    
    // The scrollView is in the proccess of scrolling...
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
        
    }
    
    // The keyboard is about to be hidden...
    func keyboardWillHide(notification: NSNotification) {
        // Move the buttons back down to it's original position
        buttonParentView.transform = CGAffineTransformIdentity
        // Return the ScrollView to it's original position
        scrollView.contentOffset.y = 0
        // Disable scrolling when keyboard is hidden
        scrollView.scrollEnabled = false
    }
    
    
    
    
    @IBAction func didTapBack(sender: AnyObject) {
        print("tappedback")
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        if (emailField.text!.isEmpty || passwordField.text!.isEmpty) {
            let alertController = UIAlertController(title: "Oops!", message: "Please Enter an email and password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Close", style: .Cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        }
        else if (emailField.text == "member@db.com" && passwordField.text == "password") {
            self.loginIndicator.startAnimating()
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.performSegueWithIdentifier("toTutorial", sender: self)
            })
        }
        else {
            let alertController = UIAlertController(title: "Bummer!", message: "Your email or password in incorrect", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Close", style: .Cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            self.loginIndicator.startAnimating()
            delay(2, closure: { () -> () in
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                self.loginIndicator.stopAnimating()
            })
            
        }
    
    }

}
