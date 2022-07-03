//
//  NewsTableViewCell.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 03.07.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsTextLabel: UILabel!

    @IBOutlet weak var firstImage: UIImageView!

    @IBOutlet weak var secondImage: UIImageView!

    @IBOutlet weak var thirdImage: UIImageView!

    @IBOutlet weak var viewsCountLabel: UILabel!


    override func prepareForReuse() {
        super.prepareForReuse()
        newsTextLabel.text = nil
        firstImage.image = nil
        secondImage.image = nil
        thirdImage.image = nil
        viewsCountLabel.text = nil
    }

//пересмотреть нужен или нет
    func configureCell(news: News) {
        newsTextLabel.text = news.text
//        firstImage.image = news.myFriendNews?.photos[0]
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func setLike(_ sender: UIButton) {
    }

    @IBAction func writeComment(_ sender: UIButton) {
    }

    @IBAction func sharePost(_ sender: UIButton) {
    }



    
}
