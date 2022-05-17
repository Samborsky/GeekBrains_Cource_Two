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
        // Do any additional setup after loading the view.

//        navigationController?.navigationBar.backgroundColor = .red
    }
//MARK: - кнопка Войти
    @IBAction func loginButtonPressing(_ sender: UIButton) {

        guard let login = loginTextField.text,
        let password = passwordTextField.text else { return }

        if login == "login" && password == "qwerty" {
            print("Вы вошли")
            loginTextField.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            passwordTextField.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
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
            let alertVC =  UIAlertController.init(title: "Ошибка!", message: "Вы ввели неправильные данные, попробуйте еще раз", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }
    }
//MARK: - Кнопка Зарегистрироваться

    @IBAction func RegistrationButton(_ sender: Any) {
        performSegue(withIdentifier: "toLoginView", sender: nil)
    }

}
