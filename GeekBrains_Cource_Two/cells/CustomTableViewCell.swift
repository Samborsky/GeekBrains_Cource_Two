//
//  CustomTableViewCell.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 18.05.2022.
//

import UIKit
import SDWebImage

class CustomTableViewCell: UITableViewCell {


    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var viewForShadow: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var cityLabel: UILabel!

    @IBOutlet weak var ageLabel: UILabel!
    
///метод позволяет переиспользовать ячейку, как нам нужно. можно очищать данные ячейки при переиспользовании
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        nameLabel.text = nil
        cityLabel.text = nil
        ageLabel.text = nil
    }
///метод который конфигурирует, что отображать в ячейке
    func configure(friend: FriendsPropetries, image: String?) {
    
        nameLabel.text = friend.lastName! + " " + friend.firstName!
        ageLabel.text = friend.birthday
        cityLabel.text = friend.city?.title
        
        if image != nil {
            avatarImageView.sd_setImage(with: URL(string: image!))
        }
    }

    func configure(group: GroupsProperties, image: String?) {
        if image != nil {
            avatarImageView.sd_setImage(with: URL(string: image!))
        }
        
        nameLabel.text = group.name
        cityLabel.text = group.description
    }

    override func awakeFromNib() {
        super.awakeFromNib()
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    @IBAction func pressAvatarButton(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.avatarImageView.frame = CGRect(x: self.avatarImageView.frame.origin.x + 15, y: self.avatarImageView.frame.origin.y + 15, width: self.avatarImageView.frame.width - 30, height: self.avatarImageView.frame.height - 30)
          
        }
        UIView.animate(withDuration: 1) {
            self.viewForShadow.frame = CGRect(x: self.viewForShadow.frame.origin.x + 15, y: self.viewForShadow.frame.origin.y + 15, width: self.viewForShadow.frame.width - 30, height: self.viewForShadow.frame.height - 30)
        }
        
    }

}

