//
//  FriendsPhotos.swift
//  GeekBrains_Cource_Two
//
//  Created by Admin on 14.08.2022.
//

import Foundation
import UIKit


struct ResponseFriendsPhotos: Codable {
    let response: FriendsAlbums
}

struct FriendsAlbums: Codable {
    let count: Int
    let items: [FriendsPhotos]
}

struct FriendsPhotos: Codable {
    let id: Int
    let ownerID: Int
    let sizes: [Size]
    let likes: Likes
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
        case likes
    }
    
}
struct Size: Codable {
    let height: Int
    let url: String
    let type: String
    let width: Int
}

enum TypeEnum: String, Codable {
    case m = "m"
}
struct Likes: Codable {
    let count: Int
    let userLike: Int
    
    enum CodingKeys: String, CodingKey {
        case count
        case userLike = "user_likes"
    }
}

//MARK: - class


//class ResponseFriendsPhotos: Codable {
//    let response: FriendsAlbums
//}
//
//class FriendsAlbums: Codable {
//    let count: Int
//    let items: [FriendsPhotos]
//}
//
//class FriendsPhotos: Object, Codable {
//    @Persisted var id: Int
//    @Persisted var ownerID: Int
//    @Persisted var sizes: List<Size>
//    @Persisted var likes: List<Likes>
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case ownerID = "owner_id"
//        case sizes
//        case likes
//    }
//
//}
//class Size: Object, Codable {
//    @Persisted var height: Int
//    @Persisted var url: String
//    @Persisted var type: String
//    @Persisted var width: Int
//}
//
//enum TypeEnum: String, Codable {
//    case m = "m"
//}
//class Likes: Object, Codable {
//    @Persisted var count: Int
//    @Persisted var userLike: Int
//
//    enum CodingKeys: String, CodingKey {
//        case count
//        case userLike = "user_likes"
//    }
//}
