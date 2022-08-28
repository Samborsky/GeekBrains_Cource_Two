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


    @IBInspectable var shadowColor = UIColor.red
    @IBInspectable var shadowOpacity: Float = 0.8
    @IBInspectable var shadowRadius: CGFloat = 7

    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowOpacity = shadowOpacity
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        avatar.layer.cornerRadius = bounds.height / 2
        shadowView.layer.cornerRadius = bounds.height / 2
    }
}
