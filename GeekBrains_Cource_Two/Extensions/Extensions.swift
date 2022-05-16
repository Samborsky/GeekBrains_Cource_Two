//
//  Extensions.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 17.05.2022.
//

import Foundation
import UIKit

extension UIViewController {
    ///убираем клавиатуру по тапу на экран
    func tapGestureForHideKeyboard() {
        let tapRecognizer = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapRecognizer)
    }
}
