//
//  Friends.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 18.05.2022.
//

import UIKit
import RealmSwift

// MARK: - фейковые друзья

struct Friend {
    var name: String
    var age: String
    var avatar: UIImage?
    var photos: [UIImage]
}

//MARK: - структура с друзьями

class ResponseFriends: Decodable {
    var response: Friends
}


class Friends: Decodable {
     var count: Int
     var items: [FriendsPropetries]
}
    
//MARK: - структура со свойствами друзей

class FriendsPropetries: Object, Decodable {
    //если нам приходят названия свойств с непонятными именами, мы можем их переопределить через энам
    @Persisted var id: Int?
    @Persisted var birthday: String?
    @Persisted var city: FriendsCity?
    @Persisted var country: FriendsCity?
    @Persisted var status: String?
    @Persisted var avatar: String?
    @Persisted var firstName: String?
    @Persisted var lastName: String?

//энам нужен для переопределения названий элементов структуры. подписываем его на протокол CodingKey и String и в case пишем желаемое название = название которое пришло с api
      enum CodingKeys: String, CodingKey {
          case id, city, country, status
          case birthday = "bdate"
          case avatar = "photo_100"
          case firstName = "first_name"
          case lastName = "last_name"
      }
  }

//MARK: - структура для города/страны

class FriendsCity: Object, Decodable {
    @Persisted var id: Int
    @Persisted var title: String
}
