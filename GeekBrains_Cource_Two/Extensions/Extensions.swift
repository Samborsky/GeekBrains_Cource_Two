//
//  Extensions.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 17.05.2022.
//

import Foundation
import UIKit
//MARK: - расширения для логина/регистрации
extension UIViewController {
    ///убираем клавиатуру по тапу на экран
    func tapGestureForHideKeyboard() {
        let tapRecognizer = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapRecognizer)
    }
    ///вызываем алерт тайтлом "Ошибка!" и с тексом ошибки message
    func alertErrorMessage(message: String) {
        let alertVC = UIAlertController(title: "Ошибка!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default)
        alertVC.addAction(alertAction)
        present(alertVC, animated: true, completion: nil)
    }

}
//MARK: - расширения для таблицы UITableView
extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
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
        return friendsArray.count
    }

    ///метод позволяющий заполнять ячейки таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //приводим нашу ячейку к типу xib файла(UITableViewCell)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as?
                CustomTableViewCell else { return UITableViewCell()}
//        cell.configure(friend: friendsArray[indexPath.row]) // эта строка позволяет добавить все компоненты массива сразу (name, age, avatar) или можно как ниже, каждый добавить отдельно
        cell.nameLabel.text = friendsArray[indexPath.row].name
        cell.avatarImageView.image = friendsArray[indexPath.row].avatar
        cell.ageLabel.text = friendsArray[indexPath.row].age
        return cell
    }
    //метод обрабатывающий нажатие на ячейку. можно вывести в консоль куда именно нажал человек
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("нажата строка \(indexPath.row) в секции \(indexPath.section)")
        }
}
