//
//  NewsTableViewCell.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 03.07.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

//MARK: - аутлеты


    @IBOutlet weak var newsTextLabel: UILabel!
    
    @IBOutlet weak var photo: UIImageView!

    @IBOutlet weak var likesLabel: UILabel!

    @IBOutlet weak var likeButton: UIButton!

    @IBOutlet weak var viewsLabel: UILabel!



//MARK: - константы и переменные
    var isLike = true
    var likesCount = 0
    var viewsCount = 0


    //MARK: - методы

//меняем внешний вид кнопки
    func likeButtonAppearence() {
        likeButton.layer.shadowColor = UIColor.black.cgColor
        likeButton.layer.shadowRadius = 5
        likeButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        likeButton.layer.shadowOpacity = 0.8
    }

    //переиспользуем ячейки
    override func prepareForReuse() {
        super.prepareForReuse()
        newsTextLabel.text = nil
        photo.image = nil
        //увеличиваем просмотры новостей при скролинге(ячейки пересоздаются и происходит подсчет)
        viewsCount += 1
        viewsLabel.text = String(viewsCount)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    //MARK: - экшены


    @IBAction func setLike(_ sender: UIButton) {
        if isLike {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = .red
            likeButtonAppearence()
            likesCount += 1
        } else {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = .lightGray

            likesCount -= 1
        }
        isLike.toggle()
        likesLabel.text = String(likesCount)

    }




    @IBAction func writeComment(_ sender: UIButton) {
    }

    @IBAction func sharePost(_ sender: UIButton) {
    }



    
}
