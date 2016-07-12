////
////  ProfileViewController.swift
////  FBLoginAndShowImage
////
////  Created by KurtHo on 2016/7/6.
////  Copyright © 2016年 Kurt. All rights reserved.
////
//
//import UIKit
//
//
//
//class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
//    
//
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return ProfilePictureList.pic.count
//    }
//    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProfileCell", forIndexPath: indexPath) as! ProfileHeadCollectionViewCell
//        cell.profileHead.image = UIImage(named: ProfilePictureList.pic[indexPath.row].name)
//        
//        return cell
//    }
//    
//    
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
