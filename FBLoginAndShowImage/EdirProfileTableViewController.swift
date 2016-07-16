//
//  EdirProfileTableViewController.swift
//  FBLoginAndShowImage
//
//  Created by KurtHo on 2016/7/13.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class EdirProfileTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let profileData = ProfileData(name: "", gender: "", age: "", place: "", relation: "", trait: "", content: "")
    

    @IBOutlet weak var image1: UIImageView!
    @IBAction func headImageAction1(sender: AnyObject) {
        photoPicker()
        CurrentUser.shareInstance.profileData = profileData
//        CurrentUser.shareInstance.profileData?.name = "13"
        print("EditProfile age~~~\(CurrentUser.shareInstance.profileData?.name)")
    }
    @IBAction func headImageAction2(sender: AnyObject) {
        photoPicker()
    }
    @IBAction func headImageAction3(sender: AnyObject) {
        photoPicker()
    }
    @IBAction func headImageAction4(sender: AnyObject) {
        photoPicker()
    }
    
    @IBAction func genderEdit(sender: AnyObject) {
        editGenderPopUp()
    }
    @IBOutlet weak var genderLabel: UILabel!
    
    
    @IBAction func birthEdit(sender: AnyObject) {
        showPopUp()
    }
    @IBOutlet weak var birthLabel: UILabel!
    
    
    @IBAction func placeEdit(sender: AnyObject) {
        editPlacePopIp()
    }
    
    @IBOutlet weak var placeLabel: UILabel!
    
    @IBAction func relationEdit(sender: AnyObject) {
        editRelationPopIp()
    }
    
    @IBOutlet weak var relationLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrentUser.shareInstance.profileData?.age
        CurrentUser.shareInstance.profileData?.gender
        CurrentUser.shareInstance.profileData?.place
        CurrentUser.shareInstance.profileData?.relation

    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        birthLabel.text = CurrentUser.shareInstance.profileData?.age
        genderLabel.text = CurrentUser.shareInstance.profileData?.gender
        placeLabel.text = CurrentUser.shareInstance.profileData?.place
        relationLabel.text = CurrentUser.shareInstance.profileData?.relation
        
        print("birthLabel.text~~~\(birthLabel.text)")
        print("Curr.share.profi.age~~\(CurrentUser.shareInstance.profileData?.age)")
        loadViewIfNeeded()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    func photoPicker() {
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .PhotoLibrary
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
         image1.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }

    
    // MARK: - Pop up edit
    
    func showPopUp() {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("sbPopUpID") as!
        PopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMoveToParentViewController(self)

    }
    
    func editGenderPopUp() {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("sbEditGender") as! EditGenderViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMoveToParentViewController(self)
        
    }
    
    func editPlacePopIp() {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("sbEditPlace") as! EditPlaceViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMoveToParentViewController(self)
        
    }
    
    func editRelationPopIp() {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("sbEditRelation") as!
            EditRelationViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMoveToParentViewController(self)
        
    }
    
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
