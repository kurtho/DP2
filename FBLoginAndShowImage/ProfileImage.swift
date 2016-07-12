//
//  ProfileImage.swift
//  FBLoginAndShowImage
//
//  Created by KurtHo on 2016/7/4.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import Foundation


class ProfileImageList {
    static var pic = [
        ProfileImageList(name: "rufy", description: "蒙其·D·魯夫是《ONE PIECE》的主角，「D」之一族，草帽海賊團的船長。同時也是「頂點戰爭」發生前登陸夏波帝諸島的海賊界11位超新星之1（因司法島事件當時的懸賞金排名在11人中的第2名）。是個留著黑色短髮的陽光少年，左眼下方有疤痕，是為了向「紅髮」傑克証明自己的勇敢，自己用刀劃傷而留下的。 其特徵「草帽」是其童年偶像「紅髮」傑克托為保管的，故常被稱為「草帽小子」。", content: ""),
        ProfileImageList(name: "rufy", description: "1234567890", content: ""),
        ProfileImageList(name: "nami", description: "", content: ""),
        ProfileImageList(name: "robin", description: "", content: ""),
        ProfileImageList(name: "sanji", description: "", content: ""),
        ProfileImageList(name: "shark", description: "", content: ""),
        ProfileImageList(name: "solon", description: "", content: ""),
        ProfileImageList(name: "usobu", description: "", content: ""),
        ProfileImageList(name: "1", description: "", content: ""),
        ProfileImageList(name: "2", description: "", content: "")
    ]
    var name: String
    var description: String
    var content: String
    
    init(name: String, description: String, content: String){
        self.name = name
        self.description = description
        self.content = content
    }
}

class ProfilePictureList {

    static var pic = [
        ProfilePictureList(name: "1", description: "", content: ""),
        ProfilePictureList(name: "2", description: "", content: ""),
        ProfilePictureList(name: "3", description: "", content: ""),
        ProfilePictureList(name: "4", description: "", content: "")
    ]
    var name: String
    var description: String
    var content: String
    
    init(name: String, description: String, content: String){
        self.name = name
        self.description = description
        self.content = content
    }
}
