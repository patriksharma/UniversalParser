//
//  CellViewModel.swift
//  ExampleParser
//
//  Created by prateek sharma on 23/04/19.
//  Copyright © 2019 PrateekSharma. All rights reserved.
//

import Foundation

struct CellViewModel:Codable{
    var user:UserModel
    var urls:ImageURLModel
    
    var id:String
    var created_at:String
    var width:Int
    var height:Int
    var color:String
    var likes:Int
    var liked_by_user: Bool
    
    
}
