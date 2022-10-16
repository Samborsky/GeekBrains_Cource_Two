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

struct ResponseFriends: Decodable {
var response: Friends
}

struct Friends: Decodable {
    var count: Int
    var items: [FriendsPropetries]
}
    
//MARK: - структура со свойствами друзей

struct FriendsPropetries: Decodable {
    //если нам приходят названия свойств с непонятными именами, мы можем их переопределить через энам
      let id: Int?
      let birthday: String?
      let city, country: FriendsCity?
      let status: String?
      let avatar: String?
      let firstName, lastName: String?
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(Int.self, forKey: .id)
//        self.birthday = try container.decode(String?.self, forKey: .birthday)
//        self.city = try container.decode(FriendsCity?.self, forKey: .city)
//        self.country = try container.decode(FriendsCity?.self, forKey: .country)
//        self.status = try container.decode(String?.self, forKey: .status)
//        self.avatar = try container.decode(String.self, forKey: .avatar)
//        self.firstName = try container.decode(String.self, forKey: .firstName)
//        self.lastName = try container.decode(String.self, forKey: .lastName)
    

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

struct FriendsCity: Decodable {
    let id: Int
    let title: String
}
