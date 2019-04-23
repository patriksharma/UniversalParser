//
//  UserModel.swift
//  ExampleParser
//
//  Created by prateek sharma on 23/04/19.
//  Copyright © 2019 PrateekSharma. All rights reserved.
//

import Foundation

struct UserModel:Codable{
    var id:String
    var username:String
    var name:String
    var profile_image:ProfileImageModel
}

struct ProfileImageModel:Codable{
    var small:String
    var medium:String
    var large:String
}
