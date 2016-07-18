//
//  PopUpViewController.swift
//  FBLoginAndShowImage
//
//  Created by KurtHo on 2016/7/14.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

@objc protocol BirthDataDelegate: class {
    
}

class PopUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var delegate: BirthDataDelegate?
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var showPicker: UILabel!
    
    @IBAction func invisibleButton(sender: AnyObject) {
        removeAnimate()
        CurrentUser.shareInstance.profileData = profileData
        CurrentUser.shareInstance.profileData?.age = myBirth

        print("profileData.age~~\(CurrentUser.shareInstance.profileData?.age)")
    }
    @IBOutlet weak var birthLabel: UILabel!

    var myBirth = ""
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
        case era = 0
        case eraTen = 1
        case month = 2
        case date = 3
    }
    
    let pickerData = [
        ["19","20"],
        ["50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","00","01","02","03","04","05","06","07","08","09","10"],
        
        ["1","2","3","4","5","6","7","8","9","10","11","12"],
        
        ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    ]
    
    func updateLabel() {
        let oneComponent = PickerComponent.era.rawValue
        let twoComponent = PickerComponent.eraTen.rawValue
        let threeComponent = PickerComponent.month.rawValue
        let fourComponent = PickerComponent.date.rawValue
        
        let one = pickerData[oneComponent][pickerView.selectedRowInComponent(oneComponent)]
        let two = pickerData[twoComponent][pickerView.selectedRowInComponent(twoComponent)]
        let three = pickerData[threeComponent][pickerView.selectedRowInComponent(threeComponent)]
        let four = pickerData[fourComponent][pickerView.selectedRowInComponent(fourComponent)]
        
        showPicker.text = "生日: " + one + two + "年 " + three + "月 " + four + "日"
        myBirth = one + two + "/" + three + "/" + four
        print(myBirth)
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
