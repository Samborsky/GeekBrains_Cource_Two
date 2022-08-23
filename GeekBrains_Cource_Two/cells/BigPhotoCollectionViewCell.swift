//
//  BigPhotoCollectionViewCell.swift
//  GeekBrains_Cource_Two
//
//  Created by Admin on 23.08.2022.
//

import UIKit
import SDWebImage

class BigPhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photo: UIImageView!
    
   static let reuseId = "BigPhotoCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.photo.image = nil
    }
    
    
    func configCell(image: String?) {
        if image != nil {
        self.photo.sd_setImage(with: URL(string: image!))
        }
    }
}
