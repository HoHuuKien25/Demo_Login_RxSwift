//
//  UserModel.swift
//  test
//
//  Created by Hữu Kiên on 18/08/2023.
//

import Foundation

struct User {
    var firstName: String?
    var lastName: String?
    var account: String?
    var password: String?
    var confirmPass: String?
}

class DataManager {
    
    private static var sharedDataManager: DataManager = {
        let dataManager = DataManager()
        return dataManager
    }()
    
    class func shared() -> DataManager {
        return sharedDataManager
    }
    
    // init
    private init() {}
    
    //open database
    func read() -> (String, String, String, String) {
        let firstName = UserDefaults.standard.string(forKey: "firstName") ?? ""
        let lastName = UserDefaults.standard.string(forKey: "lastName") ?? ""
        let username = UserDefaults.standard.string(forKey: "username") ?? ""
        let password = UserDefaults.standard.string(forKey: "password") ?? ""
        return (firstName, lastName, username, password)
    }
    
    //save database
    func save(firstName: String, lastName: String, username: String, password: String) {
        UserDefaults.standard.set(username, forKey: "firstName")
        UserDefaults.standard.set(password, forKey: "lastName")
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.synchronize()
    }
}
