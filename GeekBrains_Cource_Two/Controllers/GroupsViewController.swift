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


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
