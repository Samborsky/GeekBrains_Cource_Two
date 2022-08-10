//
//  Singleton.swift
//  GeekBrains_Cource_Two
//
//  Created by Admin on 04.08.2022.
//

import Foundation
import UIKit

///переменная для хранения логина и пароля
var userDefaults = UserDefaults.standard

///синглтон для будующей работы с ВК
class Singleton {
    static let shared = Singleton()
    
    private init() {}
    
    var token: String = ""
    var userID: String = "8981726"
}
