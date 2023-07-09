//
//  ProfileModel.swift
//  JoyDev_Practice
//
//  Created by  ProveY0urW0rth on 08.07.2023.
//

import Foundation

struct Profile:Codable{
    var name: String
    var username: String
    var bio:String
    var joinDate:String
    var following:Int
    var followers:Int
    var imageUrl: String
}

