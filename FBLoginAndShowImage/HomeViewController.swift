//
//  HomeViewController.swift
//  FBLoginAndShowImage
//
//  Created by KurtHo on 2016/6/29.
//  Copyright © 2016年 Kurt. All rights reserved.
//
import FBSDKCoreKit
import FirebaseAuth
import Firebase
import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var fbProfilePic: UIImageView!
    @IBOutlet weak var fbName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var traitLabel: UILabel!
    @IBOutlet weak var fbProfileImage: UIBarButtonItem!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    func changeProfileImage() {
//        profileImage.image = UIImage(named: ProfileImageList.pic[2].name)
//        var filePicture = ProfileImageList.pic[0].name
//如何改變CollectionView裡面四張照片
        
//        print("Delegate Image")
//        print("ProfileImageList.pic  ~\(ProfileImageList.pic[2].name)")
    }

    
    
    
    
    
    
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProfilePictureList.pic.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProfileCell", forIndexPath: indexPath) as! ProfileHeadCollectionViewCell
        cell.profileHead.image = UIImage(named: ProfilePictureList.pic[indexPath.row].name)
        
        return cell
    }
    

    
    
    
    
    
    @IBAction func didTapLogOut(sender: AnyObject) {
        try! FIRAuth.auth()!.signOut()
        FBSDKAccessToken.setCurrentAccessToken(nil)
        
        let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController : UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("LogginView")
        self.presentViewController(viewController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CurrentUser.shareInstance.profileData?.name
        CurrentUser.shareInstance.profileData?.age

        self.collectionView.layer.cornerRadius = self.collectionView.frame.size.width/2
        self.collectionView.clipsToBounds = true
        
        if let user = FIRAuth.auth()?.currentUser {
            let name = user.displayName
//            let email = user.email
            let photoUrl = user.photoURL
//            let uid = user.uid;
            
            self.fbName.text = name
            if let photoURL = photoUrl {
                if let data = NSData(contentsOfURL: photoURL) {
                    self.fbProfilePic.image = UIImage(data: data)

                }
            }
            
                    // Do any additional setup after loading the view.

        } else {
            // No user is signed in.
        }


        
        contentLabel.text = ProfileImageList.pic[0].description
        nameLabel.text = "蒙奇・D・魯夫"
        
//        ageLabel.text = CurrentUser.shareInstance.profileData?.nameLabel
        
        
        
        placeLabel.text = "海上"
        traitLabel.text = "吃肉、草帽、橡膠、當上海賊王"
        
    }
    var petTest = PetClass()

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        ageLabel.text = CurrentUser.shareInstance.profileData?.age
//        print("HomeView age~~~\(CurrentUser.shareInstance.profileData?.name)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        
        // Dispose of any resources that can be recreated.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}


