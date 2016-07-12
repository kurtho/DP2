//
//  SearchViewController.swift
//  FBLoginAndShowImage
//
//  Created by KurtHo on 2016/7/10.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import SwiftyJSON

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var petArray = [PetClass]()

    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let layout = self.collectionViewLayout
        
        let width = (UIScreen.mainScreen().bounds.width - 20)/3
//        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)

        layout.itemSize = CGSizeMake(CGFloat(width), CGFloat(width) )
        
        let urlString: String = "http://1575d346.ngrok.io/api/v1/missions"
        Alamofire.request(.GET, urlString)
            .responseJSON {
                response in
//                                print("Response data: \(response.result.value)")
                
                if let data = response.result.value {
                    let json = JSON(data)
                    let petList = json["custom_missions"].arrayValue
//                    print(petList)
                    for pet in petList {
                    print(" content \(pet["content"].stringValue)")
                        let pets = PetClass()
                        pets.content = pet["content"].stringValue
                        pets.id = pet["id"].intValue
                        pets.popular = pet["popular"].intValue
                        self.petArray.append(pets)
                        print("content~~\(pets.content)")
                        
                        
                        //                        let ref = FIRDatabase.database().reference()
                        //reference指向firebase網站
                        //        ref.child("cust").child("cust1").setValue(["name": "Taipei 101"])
                        //let childRef = ref.child(houses.name).childByAutoId()
                        //                        ref.child(houses.name).setValue(["adress": houses.adress])
                        
                        
                    }
                }
//                print("petArray ~~ \(self.petArray)")
                self.collectionView.reloadData()
                //                print("Response data: \(response.result.value)")
                
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
        return petArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let url = NSURL(string: petArray[indexPath.row].photoLink)

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! SearchCollectionViewCell

        
        cell.layoutIfNeeded()
        cell.searchView?.sd_setImageWithURL(url, placeholderImage: nil)
        cell.searchView.layer.cornerRadius = cell.searchView.frame.size.width/2
        cell.searchView.clipsToBounds = true
        
        
        return cell
    }
    
    
    
    
    /*
    // MARK: - Navigation


    */

}


