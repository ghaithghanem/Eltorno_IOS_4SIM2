//
//  User.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 08/12/2021.
//

import Foundation

struct Users : Codable{
    var users: [User]?
}

struct User: Codable{
    
    var username : String?
    var email : String?
    var password : String?
    var profilePicture : String?
    var _id : String?
    var __v : Int?
    
    
    
    init(username:String, email:String,password:String,profilePicture:String,id:String,__v:Int) {
            
            self.username = username
            self.email = email
            self.password = password
            self.profilePicture  = profilePicture
            self._id = id
            self.__v = 0
        }
        
        init(username:String, email:String,profilePicture:String,id:String,__v:Int) {
            self.username = username
            self.email = email
            self.profilePicture  = profilePicture
            self._id = id
            self.__v = 0
        }
}


