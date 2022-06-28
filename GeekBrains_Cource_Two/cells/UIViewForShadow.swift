//
//  UIViewForShadow.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 28.06.2022.
//

import UIKit

class UIViewForShadow: UIView {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var shadowView: UIView!


    var shadowColor = UIColor.red


    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowRadius = 7
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowOpacity = 0.8
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        avatar.layer.cornerRadius = bounds.height / 2
//        shadowView.layer.cornerRadius = bounds.height / 2
    }


}
