//
//  ViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Admin on 07.05.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var loginButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureForHideKeyboard()
    }
        //MARK: - убираем клавиатуру с экрана при нажатии на экран
        //UITapGestureRecognizer класс распознавания "тапа" по экрану. target - место где UIGestureRecognizer будет искать функцию, которая будет вызываться при тапе на экран(убираем клавиатуру), написав self или nil таргет, будет искать функцию в текущем классе. action - метод который будет вызываться, с указанием #selector(имяМетода)
        //        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        ////указываем с какого элемента или целого view считывать информацию
        //        self.view.addGestureRecognizer(tapRecognizer)
        //    }
        ////метод убирающий клавиатуру с обязательной приставка @objc
        //    @objc func tapFunction() {
        //        //сам метод скрывающий клавиатуру
        //        self.view.endEditing(true)

    //MARK: - кнопка Войти

    @IBAction func loginButtonPressing(_ sender: UIButton) {

        guard let login = loginTextField.text,
              let password = passwordTextField.text else { return }

        if login == "login" && password == "qwerty" {
            print("Вы вошли")

            performSegue(withIdentifier: "toTabBarController", sender: nil)
            //дальше логика, если поля пустые
        } else if login == "" || password == "" {

            //создаем алерт если поля не заполнены
            let alertVC =  UIAlertController.init(title: "Ошибка!", message: "Вы не ввели логин или пароль", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }
        else {
            print("Неверные данные")

            //создаем алерт, если ошибка в логине/пароле
            loginTextField.backgroundColor = UIColor.red
            passwordTextField.backgroundColor = UIColor.red
            alertErrorMessage(message: "Вы ввели неправильные данные, попробуйте еще раз")
        }
    }
}
