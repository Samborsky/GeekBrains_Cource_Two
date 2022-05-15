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


    @IBAction func registrationButtonView2(_ sender: UIButton) {
        guard let login = loginTextFieldView2.text,
        let password = passwordTextFieldView2.text,
        let repeatPassword = repeatPasswordView2.text else { return }

        if login.count >= 4 && password.count >= 4 && password == repeatPassword {
            print("Поздравлям, вы успешно зарегистрировались")
            
        } else if login.count < 4 || password.count < 4 {
            print("Ошибка!")

            let alertVC =  UIAlertController.init(title: "Ошибка!", message: "Логин и пароль должны быть, как минимум 4 символа", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Повторить", style: .default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)

        } else if password != repeatPassword {
            print("пароли не совпадают!")
            let alertVC =  UIAlertController.init(title: "Ошибка!", message: "Пароли должны совпадать", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Повторить", style: .default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }


    }








}
