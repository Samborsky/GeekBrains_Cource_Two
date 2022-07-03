//
//  NewsViewController+FillData.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 03.07.2022.
//

import UIKit

var newsArray = [News]()

func fillNewsArray() {
//    let newsOne = News(text: "hello", photos: [UIImage(named: "friend1"), UIImage(named: "friend2"), UIImage(named: "friend3")])
//    let newsTwo = News(text: String.init(repeating: "hello", count: 5), photos: [UIImage(named: "group1"), UIImage(named: "group2"), UIImage(named: "group3")])
//    let newsThree = News(text: "kak dela?", photos: [UIImage(named: "group4"), UIImage(named: "group5"), UIImage(named: "group6")])


    let a1 = News(text: String.init(repeating: "hello ", count: 5), photos: [[UIImage(named: "friend1")], [UIImage(named: "friend2")], [UIImage(named: "friend3")]])
    let a2 = News(text: String.init(repeating: "hello ", count: 15), photos: [[UIImage(named: "group1")], [UIImage(named: "group2")], [UIImage(named: "group3")]])
    let a3 = News(text: String.init(repeating: "hello ", count: 7), photos: [[UIImage(named: "group4")], [UIImage(named: "group5")], [UIImage(named: "group6")]])


//    newsArray.append(newsOne)
//    newsArray.append(newsTwo)
//    newsArray.append(newsThree)
//    newsArray.append(newsFour)
//    newsArray.append(newsFive)


    newsArray.append(a1)
    newsArray.append(a2)
    newsArray.append(a3)
}
let a = newsArray[0].photos[0][0]
