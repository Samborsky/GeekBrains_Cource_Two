//
//  GalleryCollectionCell.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 31.05.2022.
//

import UIKit

class GalleryCollectionCell: UICollectionViewCell {


    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var likePhoto: UIImageView!
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var likeControl: LikeControll!
    @IBOutlet weak var container: UIView!

    var likes = Array(1...550)

@objc func handleTap(_: UITapGestureRecognizer) {
            likeControl.isLike.toggle()
            if likeControl.isLike {
                likeControl.likePhoto.image = UIImage(systemName: "heart")
                likesCount.text = ""
            } else {
                likeControl.likePhoto.image = UIImage(systemName: "heart.fill")
                likesCount.text = (String(likes.randomElement()! + 1))

                //анимация сердечка при лайке
                UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .transitionFlipFromLeft]) {
                    self.likePhoto.frame = CGRect(x: self.likePhoto.frame.origin.x + 5, y: self.likePhoto.frame.origin.y + 5, width: self.likePhoto.frame.width - 10, height: self.likePhoto.frame.height - 10)
                }

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
