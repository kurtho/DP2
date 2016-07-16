//
//  EditRelationViewController.swift
//  FBLoginAndShowImage
//
//  Created by KurtHo on 2016/7/16.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class EditRelationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var showPicker: UILabel!
    
    @IBAction func invisibleButton(sender: AnyObject) {
        removeAnimate()
        CurrentUser.shareInstance.profileData = profileData
        CurrentUser.shareInstance.profileData?.relation = relation
        
        //        print("profileData.age~~\(CurrentUser.shareInstance.profileData?.gender)")
    }
    @IBOutlet weak var birthLabel: UILabel!
    
    var relation = ""
    let profileData = ProfileData(name: "", gender: "", age: "", place: "", relation: "", trait: "", content: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimation()
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        //        self.navigationController?.navigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        birthLabel.text = CurrentUser.shareInstance.profileData?.age
        
    }
    
    
    func showAnimation() {
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
        self.view.alpha = 0.0
        UIView.animateWithDuration(0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
        })
    }
    
    
    func removeAnimate()
    {
        UIView.animateWithDuration(0.25, animations: {
            self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.view.removeFromSuperview()
                }
        });
    }
    
    
    // MARK: - PickerViewData
    
    enum PickerComponent:Int{
        case relation = 0
        
    }
    
    let pickerData = [
        ["單身", "交往中", "已婚"]
    ]
    
    func updateLabel() {
        let oneComponent = PickerComponent.relation.rawValue
        
        
        let one = pickerData[oneComponent][pickerView.selectedRowInComponent(oneComponent)]
        
        
        showPicker.text = "狀態: " + one
        relation = one
        print(relation)
        //        birthLabel.text = showPicker.text
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return updateLabel()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    
    
    
    
    
    // MARK: - Navigation
    
    
}