//
//  GroupsViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 18.05.2022.
//

import UIKit

class GroupsViewController: UIViewController {

    @IBOutlet weak var myGroupsTableView: UITableView!


    let reuseIdentifierCustom = "reuseIdentifierCustom"
    var groupsArray: [Groups] = []

    func fillGroupArray() {
        let group1 = Groups(title: "ТВ передачи", avatar: UIImage(named: "group2"), description: "расписание телепередач на каждый день")
        let group2 = Groups(title: "Все о тиграх", avatar: UIImage(named: "group1"), description: "группа №1 в мире для любителей тигров! Вся информация о крупных кошках, есть у нас!")
        let group3 = Groups(title: "Мир пум", avatar: UIImage(named: "group3"), description: "Любите пум? Тогда вам к нам!")
        let group4 = Groups(title: "Продукты. Акции", avatar: UIImage(named: "group4"), description: "Перечень товаров по акциям в магазинах вашего города")
        let group5 = Groups(title: "Бизнес", avatar: UIImage(named: "group5"), description: "Торговля на бирже, опционы, акции, валюта и облигации. Вся информаия есть здесь!")
        let group6 = Groups(title: "Любители пострелять", avatar: UIImage(named: "group6"), description: "Любите оружие и все, что с ним связано? заходите к нам в группу")
        let group7 = Groups(title: "Прогноз погоды", avatar: UIImage(named: "group7"), description: "Точный прогноз погоды на каждый день")
        groupsArray.append(group1)
        groupsArray.append(group2)
        groupsArray.append(group3)
        groupsArray.append(group4)
        groupsArray.append(group5)
        groupsArray.append(group6)
        groupsArray.append(group7)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        fillGroupArray()
        myGroupsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)

        myGroupsTableView.delegate = self
        
        myGroupsTableView.dataSource = self

    }


}
//MARK: - расширения для таблицы UITableView вкладка Группы

extension GroupsViewController: UITableViewDelegate, UITableViewDataSource {
///метод позволяющий менять размер изображения в ячейке(высоту ячейки)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    ///метод количества секций в таблице
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    ///метод количества строк в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }

    ///метод позволяющий заполнять ячейки таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //приводим нашу ячейку к типу xib файла(UITableViewCell)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as?
                CustomTableViewCell else { return UITableViewCell()}
//        cell.configure(friend: friendsArray[indexPath.row]) // эта строка позволяет добавить все компоненты массива сразу (name, age, avatar) или можно как ниже, каждый добавить отдельно
        cell.nameLabel.text = groupsArray[indexPath.row].title
        cell.avatarImageView.image = groupsArray[indexPath.row].avatar
        cell.ageLabel.text = groupsArray[indexPath.row].description
        return cell
    }
    //метод обрабатывающий нажатие на ячейку. можно вывести в консоль куда именно нажал человек
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("нажата строка \(indexPath.row) в секции \(indexPath.section). Вкладка Группы")
        }
}

