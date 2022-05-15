//
//  ViewControllerRegistration.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 15.05.2022.
//

import UIKit

class ViewControllerRegistration: UIViewController {

    @IBOutlet weak var loginTextFieldView2: UITextField!

    @IBOutlet weak var passwordTextFieldView2: UITextField!

    @IBOutlet weak var repeatPasswordView2: UITextField!





    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }




    @IBAction func registrationButtonView2(_ sender: Any) {
        guard let loginView2 = loginTextFieldView2.text,
        let password = passwordTextFieldView2.text,
        let repeatPassword = repeatPasswordView2.text else { return }

        if loginView2.count >= 4 && password.count >= 4 && password == repeatPassword {
            print("Поздравляем, вы успешно зарегистрировались")
//всплывающий алерт
            let alertVC = UIAlertController.init(title: "Поздравляем!", message: "Вы успешно зарегистрировались. Используйте ваш логин и пароль для входа", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
            alertVC.addAction(alertAction)
            present(alertVC, animated: true, completion: nil)

        } else if loginView2.count < 4 || password.count < 4 {
            print("Ошибка!")
//всплывающий алерт
            let alertVC =  UIAlertController.init(title: "Ошибка!", message: "Логин и пароль должны быть, как минимум 4 символа", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Повторить", style: .default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)

        } else if password != repeatPassword {
            print("пароли не совпадают!")
//всплывающий алерт
            let alertVC =  UIAlertController.init(title: "Ошибка!", message: "Пароли должны совпадать", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Повторить", style: .default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }


    }





}
