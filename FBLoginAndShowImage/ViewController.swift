//
//  ViewController.swift
//  FBLoginAndShowImage
//
//  Created by KurtHo on 2016/6/29.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import SDWebImage
import Alamofire
import SwiftyJSON
import FirebaseAuth

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var logginButton: FBSDKLoginButton = FBSDKLoginButton()

    @IBOutlet weak var loadSpinning: UIActivityIndicatorView!
    @IBOutlet weak var fbView: UIView!
    @IBOutlet weak var accountField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var accountLoginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logginButton.hidden = true
        
        FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
            if user != nil {
                
                let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let homeViewController : UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("HomeView")
                self.presentViewController(homeViewController, animated: true, completion: nil)
                
                
                
                
                // User is signed in.
            }else {
                // No user is signed in.
                
                
                self.logginButton.center = self.fbView.center
                self.view.addSubview(self.logginButton)
            
                self.logginButton.readPermissions = ["public_profile","email","user_friends"]
                self.logginButton.delegate = self
                self.logginButton.hidden = false
                    self.reloadInputViews()
            }
        }
        
        
        

//         Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        self.view.layoutIfNeeded()
        self.logginButton.center = self.fbView.center
        
        //after logout, the logginButton stay still
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User login in")
        loadSpinning.startAnimating()

        self.logginButton.hidden = true
        self.accountField.hidden = true
        self.passwordField.hidden = true
        self.accountLoginButton.hidden = true
        self.createAccountButton.hidden = true
        self.forgotPassword.hidden = true
        
        
        
        if error != nil {
            self.logginButton.hidden = false
            
            self.forgotPassword.hidden = false
            self.accountField.hidden = false
            self.passwordField.hidden = false
            self.accountLoginButton.hidden = false
            self.createAccountButton.hidden = false
            loadSpinning.stopAnimating()
            
        }else if (result.isCancelled) {
            self.logginButton.hidden = false
            
            self.forgotPassword.hidden = false
            self.accountField.hidden = false
            self.passwordField.hidden = false
            self.accountLoginButton.hidden = false
            self.createAccountButton.hidden = false
            loadSpinning.stopAnimating()
            
        }else {
        
        let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
        FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
            // ...
            print("User login in Firebase app")

            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User did log out")
    }
}

