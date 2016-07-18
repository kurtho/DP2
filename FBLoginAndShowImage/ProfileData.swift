//
//  ProfileData.swift
//  FBLoginAndShowImage
//
//  Created by KurtHo on 2016/7/9.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import Foundation

class ProfileData: NSObject {
    var name: String = ""
    var gender: String = ""
    var age: String = ""
    var place: String = ""
    var relation: String = ""
    var trait: String = ""
    var content: String = ""
    
    init (name: String, gender: String, age: String, place: String, relation: String ,trait: String, content: String){
        self.name = name
        self.gender = gender
        self.age = age
        self.place = place
        self.relation = relation
        self.trait = trait
        self.content = content
        }
    
}


class CurrentUser {
    static let shareInstance = CurrentUser()
    var profileData: ProfileData?
    
}


class profileList {
    static let shareInstance = profileList()
    var basicInfo = [ProfileData]()
    
    
}






class PetClass {
    var name: String = ""
    var address: String = ""
    var photoLink: String = ""
    var id: Int = 0
    var content: String = ""
    var unlock_level: String = ""
    var popular: Int = 0
}


