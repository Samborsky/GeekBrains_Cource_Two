//
//  Friends.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 18.05.2022.
//

import UIKit

class FriendsViewController: UIViewController {

    //MARK: - аутлеты и переменные

    @IBOutlet weak var myFriendsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let singletone = Singleton.shared
    var service = Service()
    

    let reuseIdentifierCustom = "reuseIdentifierCustom"
    let fromFriendsToGallerySeague = "fromFriendsToGallery"
    let cellHight = CGFloat(130)

    var lettersArray = [String]()
    //массив первых букв для серчбара
    var searchLettersArray = [String]()
    var newFriendArray = [Friend]()
    //массив друзей для серчбара
    var searchFriendsArray = [Friend]()
    var sortedArray = [Character:[Friend]]()

    //MARK: - жизненные циклы

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
        searchLettersArray = lettersArray

        sortedArray = fillNewArray(friends: friendsArray)
        //регистрируем нашу ячейку в таблице. nibName это название нашего xib файла, просто его копируем. forCellReuseIdentifier это строковый идентификатор ячейки, для определения нужно типа ячейки в TableView(чтобы ячейка была именно та, которую мы создали в xib). Его лучше указать через константу, чтобы не было ошибок в дальнейшем
        myFriendsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)

        myFriendsTableView.delegate = self
        //дальше мы говорим TableView какие ячейки отображать, для этого используем метод dataSource(), в него мы передаем класс, который будет отвечать за заполнение TableView, в нашем случае self(FriendsViewController)
        myFriendsTableView.dataSource = self

        searchBar.delegate = self
        searchBar.placeholder = "Начните вводить имя друга"
        
        //список друзей
        service.getFriends(token: singletone.token)

        
    }

    //MARK: - IBAtion и методы

///метод который добавляет первую  букву имени в новый массив
    func firstFriendLetter(){
        for item in friendsArray {
            let letter = String(item.name.prefix(1)).lowercased()
            if !lettersArray.contains(letter) {
                lettersArray.append(letter)
            }
        }
    }

//формируем новый массив друзей с учетом первой буквы
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

//делаем переход по сеге и кастим до нужных классов
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromFriendsToGallerySeague,
           let destinationVC = segue.destination as? GalleryViewController,
           let indexPath = myFriendsTableView.indexPathForSelectedRow {
            //передаем имя из массива в тайтл
            destinationVC.title = test(sourceArray: friendsArray, letter: lettersArray[indexPath.section])[indexPath.row].name
            //передаем фотографии в массив фотографий на GalleryViewController
            destinationVC.photos = test(sourceArray: friendsArray, letter: lettersArray[indexPath.section])[indexPath.row].photos//можно использовать friends.photos
            print(indexPath)
        }
    }
}

//MARK: - экстеншены

extension FriendsViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchText.isEmpty {
            //если строка пустая, отображать копию массива(не тронутый)
            friendsArray = searchFriendsArray
            lettersArray = searchLettersArray
        } else {
            friendsArray = friendsArray.filter({ friendsItem in
                friendsItem.name.lowercased().contains(searchText.lowercased())
            })
            lettersArray = [String(searchText.prefix(1))]


        }
        self.myFriendsTableView.reloadData()
    }
}
