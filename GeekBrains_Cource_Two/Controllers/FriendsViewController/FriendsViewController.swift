//
//  Friends.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 18.05.2022.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var myFriendsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    let reuseIdentifierCustom = "reuseIdentifierCustom"
    let fromFriendsToGallerySeague = "fromFriendsToGallery"
    ///высота ячейки
    let cellHight = CGFloat(130)
    var lettersArray = [String]()
    var newLettersArray = [String]()
    var newFriendArray = [Friend]()
    var searchFriendsArray = [Friend]()


    


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myFriendsTableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myFriendsTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fillFriendsArray()
        firstFriendLetter()
        searchFriendsArray = friendsArray
        newLettersArray = lettersArray

        sortedArray = fillNewArray(friends: friendsArray)
        //регистрируем нашу ячейку в таблице. nibName это название нашего xib файла, просто его копируем. forCellReuseIdentifier это строковый идентификатор ячейки, для определения нужно типа ячейки в TableView(чтобы ячейка была именно та, которую мы создали в xib). Его лучше указать через константу, чтобы не было ошибок в дальнейшем
        myFriendsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)

        myFriendsTableView.delegate = self
        //дальше мы говорим TableView какие ячейки отображать, для этого используем метод dataSource(), в него мы передаем класс, который будет отвечать за заполнение TableView, в нашем случае self(FriendsViewController)
        myFriendsTableView.dataSource = self
        searchBar.delegate = self

    }

///метод который добавляет первую  букву имени в новый массив
    func firstFriendLetter(){
        for item in friendsArray {
            let letter = String(item.name.prefix(1)).lowercased()
            if !lettersArray.contains(letter) {
                lettersArray.append(letter)
            }
        }

    }
    func test(sourceArray: [Friend], letter: String) -> [Friend] {
var resultArray = [Friend]()
        for item in sourceArray {
            let nameLetter = String(item.name.prefix(1)).lowercased()
            if nameLetter == letter.lowercased() {
                resultArray.append(item)
            }
        }
        return resultArray
    }


//делаем переход по сеге и кастим до нужных классов - этот момент разобрать детально
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromFriendsToGallerySeague,
//           let sourceVC = segue.source as? FriendsViewController,
           let destinationVC = segue.destination as? GalleryViewController,
//           let friends = sender as? Friend, - приводим к типу Friend и получаем доступ к элементам
           let indexPath = myFriendsTableView.indexPathForSelectedRow {
            destinationVC.title = test(sourceArray: friendsArray, letter: lettersArray[indexPath.section])[indexPath.row].name
//эта строка заменяет(наполняет) массив с фотками в GalleryViewController(photos) на массив фоток из friendsArray класса FriendsViewController (у них один тип UIImage поэтому нет конфликта)
            destinationVC.photos = test(sourceArray: friendsArray, letter: lettersArray[indexPath.section])[indexPath.row].photos//можно использовать friends.photos
        }
    }
}
extension FriendsViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {


        if searchText.isEmpty {
            friendsArray = searchFriendsArray
            lettersArray = newLettersArray
        } else {
            friendsArray = friendsArray.filter({ friendsItem in
                friendsItem.name.lowercased().contains(searchText.lowercased())
            })
            lettersArray = [String(searchText.prefix(1))]


        }
        self.myFriendsTableView.reloadData()
    }

}


