//
//  ProfileData.swift
//  FBLoginAndShowImage
//
//  Created by KurtHo on 2016/7/9.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import Foundation

class ProfileData: NSObject {
    var nameLabel: String = ""
    var ageLabel: String = ""
    var placeLabel: String = ""
    var traitLabel: String = ""
    var contentLabel: String = ""
    
    init (nameLabel: String, ageLabel: String, placeLabel:String ,traitLabel: String, contentLabel: String){
        self.nameLabel = nameLabel
        self.ageLabel = ageLabel
        self.placeLabel = placeLabel
        self.traitLabel = traitLabel
        self.contentLabel = contentLabel
        }
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


