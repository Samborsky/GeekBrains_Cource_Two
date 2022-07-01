//
//  GroupsViewController+DataSource.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 30.06.2022.
//

import UIKit

extension GroupsViewController: UITableViewDataSource {

///метод позволяющий менять размер изображения в ячейке(высоту ячейки)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
        cell.viewForShadow.layer.shadowColor = UIColor.white.cgColor
        return cell
    }
}
