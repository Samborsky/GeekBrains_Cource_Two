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
