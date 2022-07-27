//
//  ViewControllerRegistration.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 15.05.2022.
//

import UIKit

//MARK: - расширение UIViewController

var loginArray = [String?]()
var passwordArray = [String?]()

class RegistrationViewController: UIViewController {

    @IBOutlet weak var loginTextFieldView2: UITextField!

    @IBOutlet weak var passwordTextFieldView2: UITextField!

    @IBOutlet weak var repeatPasswordView2: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureForHideKeyboard()
        loginTextFieldView2.delegate = self
        passwordTextFieldView2.delegate = self
        repeatPasswordView2.delegate = self
    }


    ///нажатие и логика кнопки "Зарегистрироваться"
    @IBAction func registrationButtonView2(_ sender: Any) {

        guard let loginView2 = loginTextFieldView2.text,
              let password = passwordTextFieldView2.text,
              let repeatPassword = repeatPasswordView2.text else { return }

        if loginView2.count >= 4 && password.count >= 4 && password == repeatPassword {
            print("Поздравляем, вы успешно зарегистрировались")

//заполняем массивы с логином и паролем
            loginArray.append(loginView2)
            passwordArray.append(password)

            //всплывающий алерт
            let alertVC = UIAlertController.init(title: "Поздравляем!", message: "Вы успешно зарегистрировались. Используйте ваш логин и пароль для входа", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
            alertVC.addAction(alertAction)
            present(alertVC, animated: true, completion: nil)

        } else if loginView2.count < 4 || password.count < 4 {
            print("Ошибка в момент регистрации")
            //всплывающий алерт
            alertErrorMessage(message: "Логин и пароль должны быть, как минимум 4 символа")

        } else if password != repeatPassword {
            print("пароли не совпадают!")
            //всплывающий алерт
            alertErrorMessage(message: "Пароли должны совпадать")
        }
    }
}
