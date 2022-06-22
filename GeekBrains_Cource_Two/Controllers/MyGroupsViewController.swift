//
//  MyGroupsViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 01.06.2022.
//

import UIKit

class MyGroupsViewController: UIViewController {





    @IBOutlet weak var myGroupsTableView: UITableView!


    var myGroupsArray = [Groups]()

    let reuseIdentifierCustom = "reuseIdentifierCustom"



    override func viewDidLoad() {
        super.viewDidLoad()

        myGroupsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)

        myGroupsTableView.dataSource = self
        myGroupsTableView.delegate = self
   // Do any additional setup after loading the view.
    }

//сега exit при нажатии на ячейку, возращаемся на экран, на котром были ранее
    @IBAction func unwindSegueToMyGroups(segue: UIStoryboardSegue) {
        //добавляем группы в раздел МоиГруппы
        if let sourceVC = segue.source as? GroupsViewController,
           let indexPath = sourceVC.groupsTableView.indexPathForSelectedRow {
            let groups = sourceVC.groupsArray[indexPath.row]
//проверка, чтобы не было дублей групп в массиве, если title в массивах совпадает, повторно не добавляем
            if !myGroupsArray.contains(where: {$0.title == groups.title}) {
                myGroupsArray.append(groups)
//обновляем таблицу, чтобы данные отобразились, как надо
                myGroupsTableView.reloadData()
            }
        }
    }

}

extension MyGroupsViewController: UITableViewDataSource, UITableViewDelegate {
    //количество строк в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}

        cell.avatarImageView.image = myGroupsArray[indexPath.row].avatar
        cell.ageLabel.text = myGroupsArray[indexPath.row].description
        cell.nameLabel.text = myGroupsArray[indexPath.row].title
        return cell
    }
///размер картинки в таблие
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionDelete = UIContextualAction(style: .destructive, title: "Удалить") {_,_,_ in self.myGroupsArray.remove(at: indexPath.row)
            tableView.reloadData() }

        let actions = UISwipeActionsConfiguration(actions: [actionDelete])
        return actions
}


}
