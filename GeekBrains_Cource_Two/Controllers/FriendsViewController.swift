//
//  Friends.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 18.05.2022.
//

import UIKit


class FriendsViewController: UIViewController {

    @IBOutlet weak var myFriendsTableView: UITableView!

    let reuseIdentifierCustom = "reuseIdentifierCustom"
    var friendsArray: [Friend] = []
//MARK: - метод добавления пользователей в массив
///добавление друзей в массив
    func fillFriendsArray() {
        let friend1 = Friend(name: "Hulk", age: "40 лет", avatar: UIImage(named: "friend1"), photos: [UIImage(named: "friend1")!])
        let friend2 = Friend(name: "Logan", age: "35 лет", avatar: UIImage(named: "friend2"), photos: [UIImage(named: "friend1")!])
        let friend3 = Friend(name: "Wolverine", age: "40 лет", avatar: UIImage(named: "friend3"), photos: [UIImage(named: "friend1")!])
        let friend4 = Friend(name: "Captain America", age: "30 лет", avatar: UIImage(named: "friend4"), photos: [UIImage(named: "friend1")!])
        let friend5 = Friend(name: "Thor", age: "33 лет", avatar: UIImage(named: "friend5"), photos: [UIImage(named: "friend1")!])
        let friend6 = Friend(name: "Spiderman", age: "20 лет", avatar: UIImage(named: "friend6"), photos: [UIImage(named: "friend1")!])
        let friend7 = Friend(name: "Iron Man", age: "45 лет", avatar: UIImage(named: "friend7"), photos: [UIImage(named: "friend1")!])
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        friendsArray.append(friend4)
        friendsArray.append(friend5)
        friendsArray.append(friend6)
        friendsArray.append(friend7)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fillFriendsArray()
        //регистрируем нашу ячейку в таблице. nibName это название нашего xib файла, просто его копируем. forCellReuseIdentifier это строковый идентификатор ячейки, для определения нужно типа ячейки в TableView. Его лучше указать через константу, чтобы не было ошибок в дальнейшем
        myFriendsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)

        myFriendsTableView.delegate = self
        //дальше мы говорим TableView какие ячейки отображать, для этого используем метод dataSource(), в него мы передаем класс, который будет отвечать за заполнение TableView, в нашем случае self(FriendsViewController)
        myFriendsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }


}
