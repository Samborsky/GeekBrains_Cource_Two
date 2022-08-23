//
//  LoginWebViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Admin on 09.08.2022.
//

import UIKit
import WebKit
import Alamofire

class LoginWebViewController: UIViewController {

    let singleton = Singleton.shared
    
    var friendsViewController: FriendsViewController?
    
    
    
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self

        requestVK()
        
        //https://oauth.vk.com/authorize?client_id=51408419
    }
    
    let urlTest = "https://oauth.vk.com/authorize?client_id=51397505&redirect_uri=https://oauth.vk.com/blank.html&display=mobile&response_type=token"
    
    func requestVK() {
        
        let config = URLSessionConfiguration.default
        _ = URLSession(configuration: config)
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "oauth.vk.com"
        constructor.path = "/authorize"
        
        constructor.queryItems = [
        URLQueryItem(name: "client_id", value: "51408419"),
        URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        URLQueryItem(name: "display", value: "mobile"),
        URLQueryItem(name: "response_type", value: "token"),
        URLQueryItem(name: "test_mode", value: "1")

        ]
        let request = URLRequest(url: constructor.url!)

        webView.load(request)
        print("123")
        print(singleton.token)
  
    }
    
    
    @IBAction func exitButton(_ sender: UIButton) {
        
        WKWebsiteDataStore.default().removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: Date(timeIntervalSince1970: 0)) {
            self.singleton.token = ""
            self.webView.load(URLRequest(url: URL(string: "https://google.com")!))
        }
    }
    
    
}



extension LoginWebViewController: WKNavigationDelegate {
  
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        //после авторизации мы попадаем на странницу "https://oauth.vk.com/blank.html" как и указывали
        
        //здесь мы будем отлавливать переход после авторизаци и распарсим url с редиректа
        //по умолчанию redirect_uri возвращает access_token(наш токен), expires_in(время жизни токена(мы сделаи его бессрочным)) и user_id(идентификатор авторизовавшегося пользователя)
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html",
              let fragment = url.fragment else {
                  //разрешаем переход на веб-страницу
                  decisionHandler(.allow)
                  return
              }
        
print("fragment is \(fragment)")//выведет access_token, expires_in и user_id в строковом виде
        
        let params = fragment.components(separatedBy: "&").map { data in
            data.components(separatedBy: "=")
        }//создаем словарь и наполняем его
            .reduce([String:String]()) { res, param in
            
            //создаст масив с элементами access_token, expires_in и user_id
            print("&&&&&&&& =  \(fragment.components(separatedBy: "&"))")
            //добавление связки access_token, expires_in и user_id в отдельный массив, например ["expires_in", "0"]
            print("&=&=&=&=&=&=&=&=&=&=\(fragment.components(separatedBy: "&").map{$0.components(separatedBy: "=")})")
            
            //создали словарь
            var dict = res
            //ключу присваиваем первый элемент масива(["expires_in", "0"])
            let key = param[0]
            //значению присваиваем второй элемент масива(["expires_in", "0"])
            let value = param[1]
            //создаем словарь, говоря, что 0 элемент массива это ключ, 1 это значение
            dict[key] = value
            return dict
        }
        
        
        print("params is \(params)")//превратили прошлую связку в словарь, например ["expires_in": "0"]
        guard let token = params["access_token"] else {return}
        
//записываем токен в синглон
            singleton.token = token
        
            print("token has shown at LoginView. Token is - \n \(singleton.token)\n")
            guard let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FriendsViewController") as? FriendsViewController else {return}
            //разворачиваем вьюКонтроллер на весь экран
            secondVC.modalPresentationStyle = .fullScreen
            //устанавливаем анимацию перехода
            secondVC.modalTransitionStyle = .flipHorizontal
            //переходим на следующий вью
        performSegue(withIdentifier: "fromLoginToTabBar", sender: nil)
        
        decisionHandler(.cancel)
    }

    
    
    
    
}
