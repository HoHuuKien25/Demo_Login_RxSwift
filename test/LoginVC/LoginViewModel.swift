//
//  LoginViewModel.swift
//  test
//
//  Created by Hữu Kiên on 18/08/2023.
//

import Foundation
import RxSwift

class loginVM {
    
    var username = PublishSubject<String>()
    var password = PublishSubject<String>()
    let disposeBag = DisposeBag()
//    var signUpViewModel = SignUpVM()
//    init(username: String? = nil, password: String? = nil) {
//        self.username = username
//        self.password = password
//    }
    
    

    func login(completion: @escaping (Bool) -> ()) {
        
        var isValidUsername: Observable<Bool> {
            return self.username.asObservable().map { username in
                username == UserDefaults.standard.string(forKey: "username")
            }
        }
        
        var isValidPassword: Observable<Bool> {
            return self.password.asObservable().map {
                password in
                password == UserDefaults.standard.string(forKey: "password")
            }
        }
        
        var isValid: Observable<Bool> {
            return Observable.combineLatest(isValidUsername, isValidPassword) {$0 && $1}
        }
        
        isValid.subscribe(onNext: {(result) in
            completion(result)
        }).disposed(by: disposeBag)
    }
    
//    func login(/*username: String, password: String,*/ completion: (Bool) -> ()) {
//
//        if username == "" || password == "" {
//            completion(false)
//        }
//        else if username != UserDefaults.standard.string(forKey: "username") || password != UserDefaults.standard.string(forKey: "password") {
//            completion(false)
//        }
//        else {
////            self.username = ""
////            self.password = ""
//
//            completion(true)
//        }
//    }
}
