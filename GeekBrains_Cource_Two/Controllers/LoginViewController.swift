//
//  ViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Admin on 07.05.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var dotOneView: UIView!
    
    @IBOutlet weak var dotTwoView: UIView!
    
    @IBOutlet weak var dotThreeView: UIView!
    
    @IBOutlet weak var loginTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var loginButton: UIButton!

    func addShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 1
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dotOneView.layer.cornerRadius = dotOneView.frame.width / 2
        dotTwoView.layer.cornerRadius = dotTwoView.frame.width / 2
        dotThreeView.layer.cornerRadius = dotThreeView.frame.width / 2
        dotOneView.backgroundColor = .clear
        dotTwoView.backgroundColor = .clear
        dotThreeView.backgroundColor = .clear

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureForHideKeyboard()
        addShadow(view: loginTextField)
        addShadow(view: passwordTextField)
        passwordTextField.delegate = self
        loginTextField.delegate = self
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
        print("нажатие на кнопку Логин")

        guard let login = loginTextField.text,
              let password = passwordTextField.text else { return }

        UIView.animate(withDuration: 0) {
            self.loginButton.setTitle(" ", for: .normal)
        }
        UIView.animate(withDuration: 1, delay: 0.3, options: .repeat) {
            self.dotOneView.backgroundColor = .gray
            self.dotOneView.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 0.7, options: .repeat) {
            self.dotTwoView.backgroundColor = .gray

            self.dotTwoView.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 1.1, options: .repeat) {
            self.dotThreeView.backgroundColor = .gray

            self.dotThreeView.alpha = 1
        }

        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
            self.performSegue(withIdentifier: "toTabBarController", sender: nil)
            }






        }
//            print("Вы вошли")
//
//        if (login == "login" && password == "qwerty") || (login == loginArray.first(where: {$0 == login}) && password == passwordArray.first(where: {$0 == password})) {
//
//
//            print("Вы вошли")
//            print("мы на экране FriendsViewController")
//            performSegue(withIdentifier: "toTabBarController", sender: nil)
//            //дальше логика, если поля пустые
//        } else if login == "" || password == "" {
//
//            //создаем алерт если поля не заполнены
//            let alertVC =  UIAlertController.init(title: "Ошибка!", message: "Вы не ввели логин или пароль", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alertVC.addAction(okAction)
//            present(alertVC, animated: true, completion: nil)
//        }
//        else {
//            print("Неверные данные")
//
//            //создаем алерт, если ошибка в логине/пароле
//            loginTextField.backgroundColor = UIColor.red
//            passwordTextField.backgroundColor = UIColor.red
//
            ///метод позволяющий выполнять код внутри замыкания с задержкой
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [self] in
//                self.loginTextField.backgroundColor = UIColor.white
//                self.passwordTextField.backgroundColor = UIColor.white
//            }
//
//            alertErrorMessage(message: "Вы ввели неправильные данные, попробуйте еще раз")
//        }


    @IBAction func registrationButtonPressing(_ sender: UIButton) {
        print("нажатие на кнопку Регистрация")
        print("мы на экране RegistrationViewController")

        performSegue(withIdentifier: "toReg", sender: nil)

    }

    }
