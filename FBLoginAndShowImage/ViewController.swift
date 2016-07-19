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


import SwiftyJSON
import FirebaseAuth
import Firebase

class ViewController: UIViewController, FBSDKLoginButtonDelegate, UITextFieldDelegate {
    
    var logginButton: FBSDKLoginButton = FBSDKLoginButton()

    @IBOutlet weak var loadSpinning: UIActivityIndicatorView!
    @IBOutlet weak var fbView: UIView!
    @IBOutlet weak var accountField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var accountLoginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!

    
    @IBAction func LoginActionButton(sender: AnyObject) {
        login()
    }


    
    @IBAction func createAccountButton(sender: AnyObject) {
        FIRAuth.auth()?.createUserWithEmail(accountField.text!, password: passwordField.text!, completion: {
            user, error in
            if error != nil {
                self.accountRepeatly()

//                self.login()
                print("123124")
//                                means accout has been created
            }else {
                
                print("user created")
                self.login()
            }
            
        })
        
    }
    
    
    
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
                
                

            }
            self.logginButton.center = self.fbView.center
            self.view.addSubview(self.logginButton)
            
            self.logginButton.readPermissions = ["public_profile","email","user_friends"]
            self.logginButton.delegate = self
            self.logginButton.hidden = false
            self.reloadInputViews()
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
    
    
    
    func login() {
        FIRAuth.auth()?.signInWithEmail(accountField.text!, password: passwordField.text!, completion: {
            user, error in
            if error != nil {
                self.alertWrongPassWordOrAccount()
                //                password or email is incorrect
                print("incorrect")
            } else {
                print("user login success")
            }
            
        })
    }
    
    

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User login in")
        loadSpinning.startAnimating()
            hideButtons()

        

        if error != nil {
            unhiddenButtons()
            loadSpinning.stopAnimating()
            
        }else if (result.isCancelled) {
            unhiddenButtons()
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
    
    func hideButtons() {
        self.logginButton.hidden = true
        self.accountField.hidden = true
        self.passwordField.hidden = true
        self.accountLoginButton.hidden = true
        self.createAccountButton.hidden = true
        self.forgotPassword.hidden = true
    }
    
    func unhiddenButtons() {
        self.logginButton.hidden = false
        self.forgotPassword.hidden = false
        self.accountField.hidden = false
        self.passwordField.hidden = false
        self.accountLoginButton.hidden = false
        self.createAccountButton.hidden = false
    }
    
    func alertWrongPassWordOrAccount() {
        let alertButton = UIAlertController(title: "帳號或密碼錯誤", message: nil, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "知道了", style: .Cancel, handler: nil)
        alertButton.addAction(okAction)
        self.presentViewController(alertButton, animated: true, completion: nil)
    }
    
    func accountRepeatly() {
        let alertButton = UIAlertController(title: "此帳號已有人使用", message: nil, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "知道了", style: .Cancel, handler: nil)
        alertButton.addAction(okAction)
        self.presentViewController(alertButton, animated: true, completion: nil)
    }
    

    // MARK: - textField
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        scrollView.setContentOffset(CGPointMake(0, 250),animated: true)
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
    }
    //輸入帳密的地方沒有彈起

    
}


