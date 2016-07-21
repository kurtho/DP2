//
//  SignUpChooseImageViewController.swift
//  FBLoginAndShowImage
//
//  Created by KurtHo on 2016/7/20.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKCoreKit

class SignUpChooseImageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var fbName: UILabel!
    
    
    @IBAction func logOut(sender: AnyObject) {
        try! FIRAuth.auth()!.signOut()
        FBSDKAccessToken.setCurrentAccessToken(nil)
        
        let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController : UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("LogginView")
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    
    @IBAction func backWard(sender: AnyObject) {
        choose -= 1
        print("choose~~\(choose)")
    }
    @IBAction func forWard(sender: AnyObject) {
        choose += 1
        print("choose~~\(choose)")
    }
    @IBAction func signUp(sender: AnyObject) {

   
    }

    
    
    
//    var visibleItems: [AnyObject] = self.collectionView.indexPathsForVisibleItems()
//    var currentItem: NSIndexPath = visibleItems[0] as! NSIndexPath
//    var nextItem: NSIndexPath = NSIndexPath.indexPathForItem(currentItem.item+1, inSection: currentItem.section)
//    self.collectionView.scrollToItemAtIndexPath(nextItem, atScrollPosition: UICollectionViewScrollPositionTop, animated: true)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.layer.cornerRadius = self.collectionView.frame.size.width/2
        self.collectionView.clipsToBounds = true

        if let user = FIRAuth.auth()?.currentUser {
            let name = user.displayName
            //            let email = user.email
            //            let uid = user.uid;
            self.fbName.text = name
//            let photoUrl = user.photoURL
//            if let photoURL = photoUrl {
//                if let data = NSData(contentsOfURL: photoURL) {
//                    self.fbProfilePic.image = UIImage(data: data)
//                }
//            }
//            // Do any additional setup after loading the view.
//            
//        } else {
//            // No user is signed in.
//        }
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProfilePictureList.pic.count
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProfileCell", forIndexPath: indexPath) as! SignUpChooseImageCollectionViewCell
        
        cell.chooseImage.image = UIImage(named: ProfilePictureList.pic[choose].name)
        
        
        
        return cell
    }


    
    
    
    var choose = 0

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
