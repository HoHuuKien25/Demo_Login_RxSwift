//
//  SignUpViewModel.swift
//  test
//
//  Created by Hữu Kiên on 18/08/2023.
//

import Foundation
import RxSwift

let regexPass = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
let predicate = NSPredicate(format: "SELF MATCHES %@", regexPass)
let regexString = ".*[0-9].*"
let predicateString = NSPredicate(format: "SELF MATCHES %@", regexString)

class SignUpVM {
    var firstName = PublishSubject<String>()
    var lastName = PublishSubject<String>()
    var account = PublishSubject<String>()
    var password = PublishSubject<String>()
    var confirmPass = PublishSubject<String>()
    let disposeBag = DisposeBag()
    
    
    func checkFormSignUp(firstName: String, lastName: String, account: String, password: String, confirmPass: String, completion: (Bool) -> ()) {
        if firstName == "" || lastName == "" || account == "" || password == "" {
            completion(false)
        }
        else if !predicate.evaluate(with: password){
            completion(false)
        }
        else if password != confirmPass {
            completion(false)
        }
        else {
            DataManager.shared().save(firstName: firstName, lastName: lastName, username: account, password: password)
            completion(true)
        }
    }
    func checkFormSignUp(completion: @escaping (Bool) -> ()) {
        var isValidFirstname: Observable<Bool> {
            return self.firstName.asObservable().map { firstname in
                firstname != "" && !predicateString.evaluate(with: firstname)
            }
        }
        var isValidLastname: Observable<Bool> {
            return self.lastName.asObservable().map { lastname in
                lastname != "" && !predicateString.evaluate(with: lastname)
            }
        }
        var isValidAccount: Observable<Bool> {
            return self.account.asObservable().map { account in
                account.count >= 6
            }
        }
        var isValidPassword: Observable<Bool> {
            return self.password.asObservable().map { password in
                password != "" && predicate.evaluate(with: password)
            }
        }
        var isValidConfirmPass: Observable<Bool> {
            return Observable.combineLatest(password, confirmPass){$0 == $1}
        }
        
        var isValid: Observable<Bool> {
            return Observable.combineLatest(isValidFirstname, isValidLastname, isValidAccount, isValidPassword, isValidConfirmPass) {$0 && $1 && $2 && $3 && $4}
        }
        
        isValid.subscribe(onNext: {(result) in
            completion(result)
        }).disposed(by: disposeBag)
    }
    
}

