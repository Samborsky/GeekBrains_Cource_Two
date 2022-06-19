//
//  GalleryCollectionCell.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 31.05.2022.
//

import UIKit

class GalleryCollectionCell: UICollectionViewCell {


    @IBOutlet weak var photoImageView: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()
        self.photoImageView.image = nil
    }

    func configure(image: UIImage) {
        photoImageView.image = image
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }





}
