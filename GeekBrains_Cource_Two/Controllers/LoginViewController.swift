//
//  ViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Admin on 07.05.2022.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - аутлеты

    @IBOutlet weak var dotOneView: UIView!
    
    @IBOutlet weak var dotTwoView: UIView!
    
    @IBOutlet weak var dotThreeView: UIView!
    
    @IBOutlet weak var loginTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var loginButton: UIButton!

//MARK: - жизненные циклы

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
        
        loginTextField.text = userDefaults.stringArray(forKey: "loginArray")?.first
        passwordTextField.text = userDefaults.stringArray(forKey: "passwordArray")?.first
    }

    

    //MARK: - IBAction и методы

//добавление тени для View
    func addShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 1
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
    }

    //кнопка Войти
    @IBAction func loginButtonPressing(_ sender: UIButton) {
        print("нажатие на кнопку Логин")

        guard let login = loginTextField.text,
              let password = passwordTextField.text else { return }

            if (login == "login" && password == "qwerty") || (login == userDefaults.stringArray(forKey: "loginArray")?.first && password == userDefaults.stringArray(forKey: "passwordArray")?.first) {
      		
                print("мы на экране FriendsViewController")
                
                //анимация точек загрузки
                        UIView.animate(withDuration: 0) {
                            self.loginButton.setTitle(" ", for: .normal)
                        }
                        UIView.animate(withDuration: 0.8, delay: 0, options: .repeat) {
                            self.dotOneView.backgroundColor = .gray
                //            self.dotOneView.alpha = 1
                            self.dotOneView.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
                        }
                        UIView.animate(withDuration: 0.8, delay: 0.1, options: .repeat) {
                            self.dotTwoView.backgroundColor = .gray
                            self.dotTwoView.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)

                //            self.dotTwoView.alpha = 1
                        }
                        UIView.animate(withDuration: 0.8, delay: 0.2, options: .repeat) {
                            self.dotThreeView.backgroundColor = .gray
                            self.dotThreeView.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)

                //            self.dotThreeView.alpha = 1
                        }

                        //таймер перед выполнением сеги
                        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
                            self.performSegue(withIdentifier: "toTabBarController", sender: nil)
                        }

                    
                                print("Вы вошли")
                    
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
    
    //метод позволяющий выполнять код внутри замыкания с задержкой
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [self] in
                    self.loginTextField.backgroundColor = UIColor.white
                    self.passwordTextField.backgroundColor = UIColor.white
                }
    
                alertErrorMessage(message: "Вы ввели неправильные данные, попробуйте еще раз")
            }
    }

//кнопка Регистрация
    @IBAction func registrationButtonPressing(_ sender: UIButton) {
        print("нажатие на кнопку Регистрация")
        print("мы на экране RegistrationViewController")

        performSegue(withIdentifier: "toReg", sender: nil)

    }
    
    @IBAction func showHidePassword(_ sender: UIButton) {
//        sender.setImage(UIImage(systemName: "eye.fill", for: .normal)
        if passwordTextField.isSecureTextEntry {
            sender.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
        }
        passwordTextField.isSecureTextEntry.toggle()

    }
    
}
