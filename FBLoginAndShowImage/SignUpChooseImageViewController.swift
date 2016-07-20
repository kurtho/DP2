//
//  SignUpChooseImageViewController.swift
//  FBLoginAndShowImage
//
//  Created by KurtHo on 2016/7/20.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class SignUpChooseImageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func backWard(sender: AnyObject) {
    }
    @IBAction func forWard(sender: AnyObject) {
        choose += 1
        print("choose~~\(choose)")
    }
    @IBAction func signUp(sender: AnyObject) {
        choose -= 1
    }

    
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.layer.cornerRadius = self.collectionView.frame.size.width/2
        self.collectionView.clipsToBounds = true
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
        loadViewIfNeeded()
        return cell
    }

    
    var choose = 0
//    var tempImage: UIImage
//    
//    func showImage() {
//        switch choose {
//        case 0:
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
