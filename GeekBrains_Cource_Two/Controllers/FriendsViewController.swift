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
    var friendsArray = [Friend]()

///добавление друзей в массив
    func fillFriendsArray() {
        let friend1 = Friend(name: "Hulk", age: "40 лет", avatar: UIImage(named: "friend1"), photos: [UIImage(named: "friend1")!])
        let friend2 = Friend(name: "Logan", age: "35 лет", avatar: UIImage(named: "friend2"), photos: [UIImage(named: "friend1")!])
        let friend3 = Friend(name: "Wolverine", age: "40 лет", avatar: UIImage(named: "friend3"), photos: [UIImage(named: "friend1")!])
        let friend4 = Friend(name: "Captain America", age: "30 лет", avatar: UIImage(named: "friend4"), photos: [UIImage(named: "friend1")!])
        let friend5 = Friend(name: "Thor", age: "33 лет", avatar: UIImage(named: "friend5"), photos: [UIImage(named: "friend1")!])
        let friend6 = Friend(name: "Spiderman", age: "20 лет", avatar: UIImage(named: "friend6"), photos: [UIImage(named: "friend1")!])
        let friend7 = Friend(name: "Iron Man", age: "45 лет", avatar: UIImage(named: "friend7"), photos: [UIImage(named: "friend1")!])
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        friendsArray.append(friend4)
        friendsArray.append(friend5)
        friendsArray.append(friend6)
        friendsArray.append(friend7)


    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fillFriendsArray()
        myFriendsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)
        myFriendsTableView.delegate = self
        myFriendsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }


}



extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as?
                CustomTableViewCell else { return UITableViewCell()}
        cell.configure(friend: friendsArray[indexPath.row])
        return cell
    }


}
