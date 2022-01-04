//
//  SendBirdApi.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 03/01/2022.
//

import Foundation
import UIKit
import SendBirdSDK

class SendBirdApi  {
    
    func SendBirdUpdateProfil (user_id:String,nickname:String,profile_url:String){
        let params = [
            "nickname": nickname,
            "profile_url": profile_url
        ]
        guard let url = URL(string: "https://api-A7093555-07F7-425F-9CA9-42037F016983.sendbird.com/v3/users/"+user_id) else{
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue( "A7093555-07F7-425F-9CA9-42037F016983", forHTTPHeaderField: "Api-Token")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        let session = URLSession.shared.dataTask(with: request){
            data, response, error in
            DispatchQueue.main.async {
                if error != nil{
                    print(error)
                }else {
                    if let jsonRes  = try? JSONSerialization.jsonObject(with: data!, options:[] ) as? [String: Any]{
                            
                        }
                        
                    }
                }
            
            
        }.resume()
    }
    
    
    func SendBirdCreateAccount (user_id:String,nickname:String,profile_url:String){
        let params = [
            "user_id": user_id,
            "nickname": nickname,
            "profile_url": profile_url
        ]
        guard let url = URL(string: "https://api-A7093555-07F7-425F-9CA9-42037F016983.sendbird.com/v3/users") else{
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue( "8268a18cc54d36824f1a08455e165d3777877368", forHTTPHeaderField: "Api-Token")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        let session = URLSession.shared.dataTask(with: request){
            data, response, error in
            DispatchQueue.main.async {
                if error != nil{
                    print(error)
                }else {
                    if let jsonRes  = try? JSONSerialization.jsonObject(with: data!, options:[] ) as? [String: Any]{
                        }
                        
                    }
                }
            
            
        }.resume()
    }
    
    
    func createChannel (name:String , callback: @escaping (Bool,Any?)->Void){
        
        let params = [
            "name": name
        ]
        guard let url = URL(string: "https://api-A7093555-07F7-425F-9CA9-42037F016983.sendbird.com/v3/open_channels") else{
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue( "8268a18cc54d36824f1a08455e165d3777877368", forHTTPHeaderField: "Api-Token")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        let session = URLSession.shared.dataTask(with: request){
            data, response, error in
            DispatchQueue.main.async {
                if error != nil{
                    print(error)
                }else {
                    if let jsonRes  = try? JSONSerialization.jsonObject(with: data!, options:[] ) as? [String: Any]{
                        print(jsonRes["channel_url"])
                        callback(true,jsonRes["channel_url"])
                            
                        }
                    else{
                        callback(false,"jsonRes")
                    }
                        
                    }
                }
            
            
        }.resume()
    }
    func deleteUser (id:String){
        
        guard let url = URL(string: "https://api-A7093555-07F7-425F-9CA9-42037F016983.sendbird.com/v3/users/"+id) else{
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue( "8268a18cc54d36824f1a08455e165d3777877368", forHTTPHeaderField: "Api-Token")
        let session = URLSession.shared.dataTask(with: request){
            data, response, error in
            DispatchQueue.main.async {
                if error != nil{
                    print(error)
                }else {
                    if let jsonRes  = try? JSONSerialization.jsonObject(with: data!, options:[] ) as? [String: Any]{
                        }
                        
                    }
                }
            
            
        }.resume()
    }

}

