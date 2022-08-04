//
//  FriendsViewControllerDataSource.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 30.06.2022.
//

import UIKit

extension FriendsViewController: UITableViewDataSource {

    ///метод количества секций в таблице, по умолчанию == 1, если секций не больше 1, можно его не писать
    func numberOfSections(in tableView: UITableView) -> Int {
        return lettersArray.count
    }
    ///метод количества строк в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let a = test(sourceArray: friendsArray, letter: lettersArray[section])
        return a.count
    }

    //метод позволяющий заполнять ячейки таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //приводим нашу ячейку к типу xib файла(UITableViewCell)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as? CustomTableViewCell else { preconditionFailure("error") }
        //делаем аватарку круглой
        cell.viewForShadow.layer.cornerRadius = cell.viewForShadow.bounds.height / 2
        cell.avatarImageView.layer.cornerRadius = cell.avatarImageView.bounds.height / 2
        
        //конфигурируем ячейку, наполняя ее данными
        cell.configure(friend: test(sourceArray: friendsArray, letter: lettersArray[indexPath.section])[indexPath.row])
return cell
    }

///метод позволяющий удалять строку при свайпе справа
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionDelete = UIContextualAction(style: .destructive, title: "Удалить") { _,_,_  in friendsArray.remove(at: indexPath.row)
            self.lettersArray.remove(at: indexPath.row)
            tableView.reloadData()
            // код выше - замыкание, определяет какие действия будут выполнены при активации действия
        }

        //здесь в замыкание мы передаем вызов алерт контроллера и метод изменения имени
        let actionEdit = UIContextualAction(style: .normal, title: "Изменить") { _,_,_ in
            let alertVC = UIAlertController(title: "Введите новое имя", message: nil, preferredStyle: .alert)

                    alertVC.addTextField(configurationHandler: {textField in textField.placeholder = "Имя"})
//передаем изменения в массив через замыкание
            let alertChange = UIAlertAction(title: "Изменить", style: .default) { _ in friendsArray[indexPath.row].name = alertVC.textFields?[0].text ?? ""
//                if self.lettersArray.isEmpty {
                    self.lettersArray.remove(at: indexPath.row)
//                }
                tableView.reloadData()
            }
            let alertCancel = UIAlertAction(title: "Отменить", style: .cancel)
                    alertVC.addAction(alertChange)
                    alertVC.addAction(alertCancel)

            self.present(alertVC, animated: true) }

        let actions = UISwipeActionsConfiguration(actions: [actionDelete, actionEdit])
        return actions
    }

//
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return lettersArray[section].uppercased()
    }
}
