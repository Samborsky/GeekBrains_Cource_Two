//
//  Groups.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 18.05.2022.
//

import UIKit
//MARK: - фейковые группы

struct Groups {
    
    var title: String
    var avatar: UIImage?
    var description: String
}

//MARK: - структура с группами

struct ResponseGroups: Decodable {
    
    let response: Group
}

struct Group: Decodable {
    
    let count: Int
    let items: [GroupsProperties]
}

//MARK: - структура со свойстами группы

struct GroupsProperties: Decodable {
    
let id: Int
let description: String
let name: String
let shortUrlName: String
let isClosed: Int
let type: String
let photo: String
let status: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case description
        case name
        case shortUrlName = "screen_name"
        case isClosed = "is_closed"
        case type
        case photo = "photo_50"
        case status
    }
    
}
