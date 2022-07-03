//
//  NewsViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 03.07.2022.
//

import UIKit

class NewsViewController: UIViewController {

let reuseIdentifierNews = "reuseIdentifierNews"


    @IBOutlet weak var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        fillNewsArray()



        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierNews)


    }
    


}
extension NewsViewController: UITableViewDelegate {

}



extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierNews, for: indexPath) as? NewsTableViewCell else { return UITableViewCell()}
        cell.newsTextLabel.text = newsArray[indexPath.row].text
//        cell.firstImage.image = newsArray[indexPath.section].photos[indexPath.row][indexPath.section]
        cell.secondImage.image = newsArray[indexPath.section].photos[indexPath.row][indexPath.section]
//        cell.thirdImage.image = newsArray[indexPath.row].photos[indexPath.row][0]

//        cell.firstImage.image = newsArray[indexPath.row].photos[indexPath.row][indexPath.row]
//        cell.secondImage.image = newsArray[indexPath.row].photos[indexPath.row][indexPath.row]
//        cell.thirdImage.image = newsArray[indexPath.row].photos[indexPath.row][indexPath.row]



//        cell.firstImage.image = UIImage(named: "friend1")
//        cell.secondImage.image = UIImage(named: "friend2")
//        cell.thirdImage.image = UIImage(named: "friend3")

        return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }


}
