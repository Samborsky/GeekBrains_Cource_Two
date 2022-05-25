//
//  CustomTableViewCell.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 18.05.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {


    @IBOutlet weak var avatarImageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var ageLabel: UILabel!


///метод позволяет переиспользовать ячейку, как нам нужно. можно очищать данные ячейки при переиспользовании
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        nameLabel.text = nil
        ageLabel.text = nil
    }
///метод который конфигурирует, что отображать в ячейке
    func configure(friend: Friend) {
        avatarImageView.image = friend.avatar
        nameLabel.text = friend.name
        ageLabel.text = friend.age
    }

    func configure(group: Group) {
        avatarImageView.image = group.avatar
        nameLabel.text = group.title
        ageLabel.text = group.description
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
