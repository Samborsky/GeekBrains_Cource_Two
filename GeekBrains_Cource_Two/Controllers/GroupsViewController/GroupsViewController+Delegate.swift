//
//  GroupsViewController+Delegate.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 30.06.2022.
//

import UIKit

extension GroupsViewController: UITableViewDelegate {

    //метод обрабатывающий нажатие на ячейку. можно вывести в консоль куда именно нажал человек
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: FromGroupsToMygroups, sender: groupsArray[indexPath.row])

            print("нажата строка \(indexPath.row) в секции \(indexPath.section). Вкладка Группы")
        }
}
