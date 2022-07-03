//
//  FriendsViewController+FillData.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 30.06.2022.
//

import UIKit

var friendsArray: [Friend] = []
var sortedArray = [Character:[Friend]]()


func fillNewArray(friends: [Friend]) -> [Character:[Friend]] {
    var newArray = [Character:[Friend]]()
    
    friends.forEach { friend in

        guard let firstChar = friend.name.first else { return }

        if var thisCharCities = newArray[firstChar] {
            thisCharCities.append(friend)
            newArray[firstChar] = thisCharCities
        } else {
            newArray[firstChar] = friends
        }
    }

return newArray
}




///заполняем массив друзьями
func fillFriendsArray() {
    let friend1 = Friend(name: "Hulk", age: "40 лет", avatar: UIImage(named: "friend1"), photos: [UIImage(named: "hulk1")!, UIImage(named: "hulk2")!, UIImage(named: "hulk3")!, UIImage(named: "hulk4")!])
    let friend2 = Friend(name: "hLogan", age: "35 лет", avatar: UIImage(named: "friend2"), photos: [UIImage(named: "logan1")!, UIImage(named: "logan2")!, UIImage(named: "logan3")!])
    let friend3 = Friend(name: "Wolverine", age: "40 лет", avatar: UIImage(named: "friend3"), photos: [UIImage(named: "wolverine1")!, UIImage(named: "wolverine12")!, UIImage(named: "wolverine3")!])
    let friend4 = Friend(name: "Captain America", age: "30 лет", avatar: UIImage(named: "friend4"), photos: [UIImage(named: "captain1")!])
    let friend5 = Friend(name: "Thor", age: "33 лет", avatar: UIImage(named: "friend5"), photos: [UIImage(named: "thor1")!, UIImage(named: "thor2")!])
    let friend6 = Friend(name: "Spiderman", age: "20 лет", avatar: UIImage(named: "friend6"), photos: [UIImage(named: "spider1")!, UIImage(named: "spider2")!, UIImage(named: "spider3")!])
    let friend7 = Friend(name: "Iron Man", age: "45 лет", avatar: UIImage(named: "friend7"), photos: [UIImage(named: "ironman1")!])
    friendsArray.append(friend1)
    friendsArray.append(friend2)
    friendsArray.append(friend3)
    friendsArray.append(friend4)
    friendsArray.append(friend5)
    friendsArray.append(friend6)
    friendsArray.append(friend7)
}
