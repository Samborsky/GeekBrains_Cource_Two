//
//  FriendsViewController+Delegate.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 30.06.2022.
//

import UIKit

extension FriendsViewController: UITableViewDelegate {
    ///метод позволяющий менять размер изображения в ячейке(высоту ячейки)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return cellHight
    }
    ///метод обрабатывающий нажатие на ячейку. можно вывести в консоль куда именно нажал человек
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("нажата строка \(indexPath.row) в секции \(indexPath.section). Вкладка друзья")
//print(searchFriendsArray)

        ///переход на GalleryViewController при нажатии на ячейку в таблице
        performSegue(withIdentifier: fromFriendsToGallerySeague, sender: nil)
    }
}

