//
//  Service.swift
//  GeekBrains_Cource_Two
//
//  Created by Admin on 10.08.2022.
//

import Foundation
import UIKit
import Alamofire

class Service {
    
    let singleton = Singleton.shared
    
    let baseURL = "https://api.vk.com/method"
    
    //MARK: - список друзей ВК
    func getFriends(token: String) {
        let friendsMethod = "/friends.get"
        let url = baseURL + friendsMethod
        
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.131",
            "order": "hints",
            "fields": "county, city, bdate, status, photo_100"
        ]
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response)
        }
    }
    
//MARK: - список групп
    func getGroups(token: String){
        let groupsMethod = "/groups.get"
        let url = baseURL + groupsMethod
        
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.131",
            "extended": 1,
            "fields": "name, description, photo_100"
        ]
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response)
        }
    }
    
    //MARK: - фотографии пользователя
    
    func getFriendPhotos(token: String, userID: String) {
        let photosMethod = "/photos.get"
        let url = baseURL + photosMethod
        
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.131",
            "owner_id": "-\(userID)",
            "album_id": "profile"
        ]
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response)
        }
    }
    
}
