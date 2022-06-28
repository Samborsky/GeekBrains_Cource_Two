//
//  GalleryCollectionCell.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 31.05.2022.
//

import UIKit

class GalleryCollectionCell: UICollectionViewCell {


    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var likeControl: LikeControll!
    @IBOutlet weak var container: UIView!

@objc func handleTap(_: UITapGestureRecognizer) {
            likeControl.isLike.toggle()
            if likeControl.isLike {
                likeControl.likePhoto.image = UIImage(systemName: "heart")
            } else {
                likeControl.likePhoto.image = UIImage(systemName: "heart.fill")
            }
        }

 

    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.numberOfTapsRequired = 2
        let tapOnHeart = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        likeControl.addGestureRecognizer(tapOnHeart)
        container.addGestureRecognizer(tap)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.photoImageView.image = nil
    }

    func configure(image: UIImage) {
        photoImageView.image = image
    }
}
