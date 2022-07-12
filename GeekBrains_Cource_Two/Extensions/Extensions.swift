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
    }
    ///вызываем алерт тайтлом "Ошибка!" и с тексом ошибки message
    func alertErrorMessage(message: String) {
        let alertVC = UIAlertController(title: "Ошибка!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default)
        alertVC.addAction(alertAction)
        present(alertVC, animated: true, completion: nil)
    }

}
//метод убирающий клавиатуру, при нажатии return
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loginTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        return true
    }
}
//метод убирающий клавиатуру, при нажатии return

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loginTextFieldView2.resignFirstResponder()
        self.passwordTextFieldView2.resignFirstResponder()
        self.repeatPasswordView2.resignFirstResponder()
        return true
    }
}


