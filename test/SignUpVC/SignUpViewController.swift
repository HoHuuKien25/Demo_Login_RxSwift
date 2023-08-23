  //
//  SignUpViewController.swift
//  test
//
//  Created by HangTTT2.FA on 14/02/2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var txtCFPassword: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtAccount: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    var signUpViewModel = SignUpVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        updateView()
        
    }
    
    func setupUI() {
        //config Text Field first name
        //font
        txtFirstName.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        txtFirstName.font = UIFont(name: "Avenir Next", size: 20)
        //text color
        txtFirstName.textColor = .white
        //Background
        //border color 241, 123, 30
        txtFirstName.layer.borderColor = UIColor(red: 241/255, green: 123/255, blue: 30/255, alpha: 1).cgColor
        txtFirstName.layer.borderWidth = 1
        //Corner
        txtFirstName.layer.cornerRadius = 25
        //Height, Width
        txtFirstName.frame.size.height = 50
        //viewUsername.frame.size.width =
        //Placeholder
        txtFirstName.attributedPlaceholder = NSAttributedString(
            string: "First name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        
        
        
        //config Text Field Last name
        //font
        txtLastName.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        txtLastName.font = UIFont(name: "Avenir Next", size: 20)
        //text color
        txtLastName.textColor = .white
        //Background
        //border color 241, 123, 30
        txtLastName.layer.borderColor = UIColor(red: 241/255, green: 123/255, blue: 30/255, alpha: 1).cgColor
        txtLastName.layer.borderWidth = 1
        //Corner
        txtLastName.layer.cornerRadius = 25
        //Height, Width
        txtLastName.frame.size.height = 50
        //viewUsername.frame.size.width =
        //Placeholder
        txtLastName.attributedPlaceholder = NSAttributedString(
            string: "Last name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        
        //config Text Field Account
        //font
        txtAccount.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        txtAccount.font = UIFont(name: "Avenir Next", size: 20)
        //text color
        txtAccount.textColor = .white
        //Background
        //border color 241, 123, 30
        txtAccount.layer.borderColor = UIColor(red: 241/255, green: 123/255, blue: 30/255, alpha: 1).cgColor
        txtAccount.layer.borderWidth = 1
        //Corner
        txtAccount.layer.cornerRadius = 25
        //Height, Width
        txtAccount.frame.size.height = 50
        //viewUsername.frame.size.width =
        //Placeholder
        txtAccount.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        
        //config Text Field Password
        //font
        txtPassword.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        txtPassword.font = UIFont(name: "Avenir Next", size: 20)
        //text color
        txtPassword.textColor = .white
        //Background
        //border color 241, 123, 30
        txtPassword.layer.borderColor = UIColor(red: 241/255, green: 123/255, blue: 30/255, alpha: 1).cgColor
        txtPassword.layer.borderWidth = 1
        //Corner
        txtPassword.layer.cornerRadius = 25
        //Height, Width
        txtPassword.frame.size.height = 50
        //viewUsername.frame.size.width =
        //Placeholder
        txtPassword.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        
        //config Text Field Confirm Password
        //font
        txtCFPassword.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        txtCFPassword.font = UIFont(name: "Avenir Next", size: 20)
        //text color
        txtCFPassword.textColor = .white
        //Background
        //border color 241, 123, 30
        txtCFPassword.layer.borderColor = UIColor(red: 241/255, green: 123/255, blue: 30/255, alpha: 1).cgColor
        txtCFPassword.layer.borderWidth = 1
        //Corner
        txtCFPassword.layer.cornerRadius = 25
        //Height, Width
        txtCFPassword.frame.size.height = 50
        //viewUsername.frame.size.width =
        //Placeholder
        txtCFPassword.attributedPlaceholder = NSAttributedString(
            string: "Confirm Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        
        //config btnSignUp
        btnSignUp.backgroundColor = UIColor(red: 240/255, green: 119/255, blue: 37/255, alpha: 1)
//        btnLogin.setTitle("Log In", for: .normal)
        btnSignUp.tintColor = UIColor(white: 1, alpha: 1)
        //border
        btnSignUp.layer.cornerRadius = 25
        
        
        //footer
        //sign up 238, 130, 19
        btnSignIn.backgroundColor = .clear
        btnSignIn.tintColor = UIColor(red: 238/255, green: 130/255, blue: 19/255, alpha: 1)
    }
    
    
    @IBAction func btnSignUpClick(_ sender: Any) {
        
//        let firstName = txtFirstName.text ?? ""
//        let lastName = txtLastName.text ?? ""
//        let username = txtAccount.text ?? ""
//        let password = txtPassword.text ?? ""
//        let confirmPass = txtCFPassword.text ?? ""
//        signUpViewModel.checkFormSignUp(firstName: firstName, lastName: lastName, account: username, password: password, confirmPass: confirmPass) { (done) in
//            if done {
//
//                }
//            else {
//
//            }
//        }
        
        signUpViewModel.checkFormSignUp() { done in
            if done {
                let alertVC = UIAlertController(title: "Thành công!", message: "Đăng ký thành công", preferredStyle: .alert)
                let action1: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (_) in
                    UserDefaults.standard.set(self.txtFirstName.text, forKey: "firstName")
                    UserDefaults.standard.set(self.txtLastName.text, forKey: "lastName")
                    UserDefaults.standard.set(self.txtAccount.text, forKey: "username")
                    UserDefaults.standard.set(self.txtPassword.text, forKey: "password")
                    self.navigationController?.popViewController(animated: true)
                }
                alertVC.addAction(action1)
                alertVC.modalPresentationStyle = .overFullScreen
                self.present(alertVC, animated: true, completion: nil)
            }
            else {
                let alertVC = UIAlertController(title: "Thất bại!", message: "Đăng ký thất bại", preferredStyle: .alert)
                let action1: UIAlertAction = UIAlertAction(title: "Thử lại", style: UIAlertAction.Style.default) { (_) in
                }
                alertVC.addAction(action1)
                alertVC.modalPresentationStyle = .overFullScreen
                self.present(alertVC, animated: true, completion: nil)
            }
        }
        
        signUpViewModel.firstName.onNext(txtFirstName.text ?? "")
        signUpViewModel.lastName.onNext(txtLastName.text ?? "")
        signUpViewModel.account.onNext(txtAccount.text ?? "")
        signUpViewModel.password.onNext(txtPassword.text ?? "")
        signUpViewModel.confirmPass.onNext(txtCFPassword.text ?? "")
    }
    
    @IBAction func btncheck(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func btnLoginVC(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
}
