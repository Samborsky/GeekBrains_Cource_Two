//
//  NewsViewController+FillData.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 03.07.2022.
//

import UIKit
//массив для экрана новостей
var newsArray = [News]()

//заполняем массив новостей
func fillNewsArray() {

    let newsOne = News(text: String.init(repeating: "текст для новостей  ", count: 5), photos: UIImage(named: "slimShady"))
    let newsTwo = News(text: String.init(repeating: "текст для новостей  ", count: 20), photos: UIImage(named: "slimShady1"))
    let newsThree = News(text: String.init(repeating: "текст для новостей ", count: 2), photos: UIImage(named: "slimShady2"))
    let newsFour = News(text: String.init(repeating: "текст для новостей ", count: 8), photos: UIImage(named: "stark"))
    let newsFive = News(text: String.init(repeating: "текст для новостей ", count: 1), photos: UIImage(named: "stark2"))
    let newsSix = News(text: String.init(repeating: "текст для новостей ", count: 10), photos: UIImage(named: "stark3"))

    newsArray.append(newsOne)
    newsArray.append(newsTwo)
    newsArray.append(newsThree)
    newsArray.append(newsFour)
    newsArray.append(newsFive)
    newsArray.append(newsSix)
}

