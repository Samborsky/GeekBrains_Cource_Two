//
//  Extensions.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 17.05.2022.
//

import Foundation
import UIKit

//MARK: - расширения для логина/регистрации
extension UIViewController {
    ///убираем клавиатуру по тапу на экран
    func tapGestureForHideKeyboard() {
        let tapRecognizer = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapRecognizer)

        //        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        ////указываем с какого элемента или целого view считывать информацию
        //        self.view.addGestureRecognizer(tapRecognizer)
        //    }
        ////метод убирающий клавиатуру с обязательной приставка @objc
        //    @objc func tapFunction() {
        //        //сам метод скрывающий клавиатуру
        //        self.view.endEditing(true)
    }
    ///вызываем алерт тайтлом "Ошибка!" и с тексом ошибки message
    func alertErrorMessage(message: String) {
        let alertVC = UIAlertController(title: "Ошибка!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default)
        alertVC.addAction(alertAction)
        present(alertVC, animated: true, completion: nil)
    }

}
//метод убирающий клавиатуру, при нажатии return в поле логина
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loginTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        return true
    }
}
//метод убирающий клавиатуру, при нажатии return в поле ригистрации

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loginTextFieldView2.resignFirstResponder()
        self.passwordTextFieldView2.resignFirstResponder()
        self.repeatPasswordView2.resignFirstResponder()
        return true
    }
}

//метод позволяющий обновлять изображение по URL ссылке(например когда парсим)
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
