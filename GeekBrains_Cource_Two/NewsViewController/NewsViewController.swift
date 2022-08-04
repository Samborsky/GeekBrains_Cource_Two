//
//  NewsViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 03.07.2022.
//

import UIKit
import AVFoundation

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
//заполняем таблицу
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierNews, for: indexPath) as? NewsTableViewCell else { return UITableViewCell()}
        cell.newsTextLabel.text = newsArray[indexPath.row].text
        cell.photo.image = newsArray[indexPath.row].photos
//        cell.likeButtonAppearence()
        cell.playerCatch(musicBand: musicArray[indexPath.row], songName: musicNamesForPlayer[indexPath.row])
        cell.volumeLabel.text = "50"
        cell.shareButton.addTarget(self, action: #selector(test(action:)), for: .touchUpInside)

        return cell

    }
    @objc func test(action: UIButton) {
      print("test")

    }


    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}
