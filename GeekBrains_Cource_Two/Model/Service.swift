//
//  Service.swift
//  GeekBrains_Cource_Two
//
//  Created by Admin on 10.08.2022.
//

import Foundation
import UIKit
import Alamofire
import CoreMedia
import SDWebImage

class Service {
    
    let singleton = Singleton.shared
    
    let baseURL = "https://api.vk.com/method"
    
    //MARK: - список друзей ВК
    
    //полная url со всеми параметрами, которые хотим получить
    //https://api.vk.com/method/friends.get?access_token=vk1.a.ori7pJIM2KPdRb2-P_85gc5L-v6r2uz9rqG5JI7w5mbxjnc91hEBLEdlS5J3pF2pSfSwFlY8wePcLwZxQFOovcW73qVVGM3aEkKWMS2UsNUesDvaye2juzmJzS2gmlz3FydtLDXUCgeZSDpucUl6uTQmSef5032d9KPQdoc8YV9W4YL0IogZXff-eCICAFZs&v=5.131&order=hints&fields=country,city,bdate,status,photo_100
    
    //complition нужен для того, чтобы использовать данные которые спарсили, например добавить их в массив. в Замыкание передаем то, что хотим вернуть
    func getFriends(token: String, complition: @escaping (Friends)->()) {
        let friendsMethod = "/friends.get"
        let url = baseURL + friendsMethod
        //массив с параметрами url
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.131",
            "order": "hints",
            "fields": "country, city, bdate, status, photo_100"
        ]
        
        //создаем запрос. указываем url, способ получения данных и параметры. и получаем данные через responseData
        AF.request(url, method: .get, parameters: parameters).responseData { data in
//            print(data)

            if let data = data.data {
                let friendsResponse = try? JSONDecoder().decode(ResponseFriends.self, from: data)
//      
                guard let friends = friendsResponse?.response else {return}
                
          complition(friends)
                
            }
        }
    }
    
//MARK: - список групп
    func getGroups(token: String, complition: @escaping (Group) -> Void){
        let groupsMethod = "/groups.get"
        let url = baseURL + groupsMethod
        
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.131",
            "extended": 1,
            "fields": "name, description, photo_50, status"
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            if let response = response.data {
                
                do {
                    let groupsResponse = try? JSONDecoder().decode(ResponseGroups.self, from: response)
                } catch {
                    print(error)
                }
                let groupsResponse = try? JSONDecoder().decode(ResponseGroups.self, from: response)
                
                guard let groups = groupsResponse?.response else {return}
                
                complition(groups)
            }
        }
    }
	
    
    //MARK: - фотографии пользователя
    
    func getFriendPhotos(token: String, userID: Int, complition: @escaping ([FriendsPhotos])-> Void) {
        let photosMethod = "/photos.get"
        let url = baseURL + photosMethod
        let id = String(singleton.userID)
        
//    https://api.vk.com/method/photos.get?access_token=vk1.a.ori7pJIM2KPdRb2-P_85gc5L-v6r2uz9rqG5JI7w5mbxjnc91hEBLEdlS5J3pF2pSfSwFlY8wePcLwZxQFOovcW73qVVGM3aEkKWMS2UsNUesDvaye2juzmJzS2gmlz3FydtLDXUCgeZSDpucUl6uTQmSef5032d9KPQdoc8YV9W4YL0IogZXff-eCICAFZs&v=5.131&owner_id=8981726&album_id=profile&photo_sizes=1&rev=1&extended=1
        
        
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.131",
            "owner_id": userID,
            "album_id": "profile",
            "photo_sizes": 0,
            "rev": 1,
            "extended": 1
        ]
        AF.request(url, method: .get, parameters: parameters).responseData { response in
          
            if let data = response.data {
                
                let friendsPhotosResponse = try? JSONDecoder().decode(ResponseFriendsPhotos.self, from: data)

                guard let friendsPhotos = friendsPhotosResponse?.response.items else {return}
                
                complition(friendsPhotos)
        }
        }
    }
 
}
