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
    let fromFriendsToGallerySeague = "fromFriendsToGallery"
    ///высота ячейки
    let cellHight = CGFloat(150)

    var friendsArray: [Friend] = []

    //MARK: - метод добавления пользователей в массив
    ///добавление друзей в массив
    func fillFriendsArray() {
        let friend1 = Friend(name: "Hulk", age: "40 лет", avatar: UIImage(named: "friend1"), photos: [UIImage(named: "hulk1")!, UIImage(named: "hulk2")!, UIImage(named: "hulk3")!, UIImage(named: "hulk4")!])
        let friend2 = Friend(name: "Logan", age: "35 лет", avatar: UIImage(named: "friend2"), photos: [UIImage(named: "logan1")!, UIImage(named: "logan2")!, UIImage(named: "logan3")!])
        let friend3 = Friend(name: "Wolverine", age: "40 лет", avatar: UIImage(named: "friend3"), photos: [UIImage(named: "wolverine1")!, UIImage(named: "wolverine12")!, UIImage(named: "wolverine3")!])
        let friend4 = Friend(name: "Captain America", age: "30 лет", avatar: UIImage(named: "friend4"), photos: [UIImage(named: "captain1")!])
        let friend5 = Friend(name: "Thor", age: "33 лет", avatar: UIImage(named: "friend5"), photos: [UIImage(named: "thor1")!, UIImage(named: "thor2")!])
        let friend6 = Friend(name: "Spiderman", age: "20 лет", avatar: UIImage(named: "friend6"), photos: [UIImage(named: "spider1")!, UIImage(named: "spider2")!, UIImage(named: "spider3")!])
        let friend7 = Friend(name: "Iron Man", age: "45 лет", avatar: UIImage(named: "friend7"), photos: [UIImage(named: "ironman1")!])
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        friendsArray.append(friend4)
        friendsArray.append(friend5)
        friendsArray.append(friend6)
        friendsArray.append(friend7)
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myFriendsTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fillFriendsArray()
        //регистрируем нашу ячейку в таблице. nibName это название нашего xib файла, просто его копируем. forCellReuseIdentifier это строковый идентификатор ячейки, для определения нужно типа ячейки в TableView(чтобы ячейка была именно та, которую мы создали в xib). Его лучше указать через константу, чтобы не было ошибок в дальнейшем
        myFriendsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)

        myFriendsTableView.delegate = self

        //дальше мы говорим TableView какие ячейки отображать, для этого используем метод dataSource(), в него мы передаем класс, который будет отвечать за заполнение TableView, в нашем случае self(FriendsViewController)
        myFriendsTableView.dataSource = self
    }

//делаем переход по сеге и кастим до нужных классов - этот момент разобрать детально
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromFriendsToGallerySeague,
//           let sourceVC = segue.source as? FriendsViewController,
           let destinationVC = segue.destination as? GalleryViewController,
//           let friends = sender as? Friend, - приводим к типу Friend и получаем доступ к элементам
           let indexPath = myFriendsTableView.indexPathForSelectedRow {
            destinationVC.title = friendsArray[indexPath.row].name
//эта строка заменяет(наполняет) массив с фотками в GalleryViewController(photos) на массив фоток из friendsArray класса FriendsViewController (у них один тип UIImage поэтому нет конфликта)
            destinationVC.photos = friendsArray[indexPath.row].photos//можно использовать friends.photos
        }
    }

}
//MARK: - расширения для таблицы UITableView вкладка Друзья

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {

    ///метод позволяющий менять размер изображения в ячейке(высоту ячейки)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //написал условия для теста. чтобы каждая вторая ячейка была другово размера
            return cellHight
    }

    ///метод количества секций в таблице, по умолчанию == 1, если секций не больше 1, можно его не писать
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
                cell.configure(friend: friendsArray[indexPath.row])
        // эта строка позволяет добавить все компоненты массива сразу (name, age, avatar) или можно как ниже, каждый добавить отдельно

//        cell.nameLabel.text = friendsArray[indexPath.row].name
//        cell.avatarImageView.image = friendsArray[indexPath.row].avatar
//        cell.ageLabel.text = friendsArray[indexPath.row].age
        return cell
    }
    //метод обрабатывающий нажатие на ячейку. можно вывести в консоль куда именно нажал человек
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("нажата строка \(indexPath.row) в секции \(indexPath.section). Вкладка друзья")
        print(friendsArray[indexPath.row].name)

        ///переход на GalleryViewController при нажатии на ячейку в таблице
        performSegue(withIdentifier: fromFriendsToGallerySeague, sender: friendsArray[indexPath.row])
    }


///метод позволяющий удалять строку при свайпе справа
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionDelete = UIContextualAction(style: .destructive, title: "Удалить") { _,_,_ in self.friendsArray.remove(at: indexPath.row)
            tableView.reloadData()
            // код выше - замыкание, определяет какие действия будут выполнены при активации действия
        }

        //здесь в замыкание мы передаем вызов алерт контроллера и метод изменения имени
        let actionEdit = UIContextualAction(style: .normal, title: "Изменить") { _,_,_ in
            let alertVC = UIAlertController(title: "Введите новое имя", message: nil, preferredStyle: .alert)

                    alertVC.addTextField(configurationHandler: {textField in textField.placeholder = "Имя"})
//передаем изменения в массив через замыкание
            let alertChange = UIAlertAction(title: "Изменить", style: .default) { _ in
                self.friendsArray[indexPath.row].name = alertVC.textFields?[0].text ?? ""
                tableView.reloadData()
            }
            let alertCancel = UIAlertAction(title: "Отменить", style: .cancel)
                    alertVC.addAction(alertChange)
                    alertVC.addAction(alertCancel)

            self.present(alertVC, animated: true) }

        let actions = UISwipeActionsConfiguration(actions: [actionDelete, actionEdit])
        return actions
    }


}
