//
//  LikeControll.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 28.06.2022.
//

import UIKit

class LikeControll: UIControl {

    @IBOutlet weak var likePhoto: UIImageView!



    var isLike = false





    override func awakeFromNib() {
        super.awakeFromNib()
        likePhoto.backgroundColor = .clear
        likePhoto.tintColor = .red
    }


}
