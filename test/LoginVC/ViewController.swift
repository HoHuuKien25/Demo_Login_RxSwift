//
//  ViewController.swift
//  test
//
//  Created by HangTTT2.FA on 13/02/2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var footerView: UIImageView!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewUsername: UIView!
    @IBOutlet weak var password: UITextField!
    var loginViewModel = loginVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        
        username.delegate = self
        password.delegate = self
        
//        _ = username.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.username)
//        _ = password.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.password)
    }
    
    
    func setupUI() {
        //config Text Field Username
        //font
        username.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        username.font = UIFont(name: "Avenir Next", size: 20)
        //text color
        username.textColor = .white
        //Background
        //border color 241, 123, 30
        viewUsername.layer.borderColor = UIColor(red: 241/255, green: 123/255, blue: 30/255, alpha: 1).cgColor
        viewUsername.layer.borderWidth = 1
        //Corner
        viewUsername.layer.cornerRadius = 25
        //Height, Width
        viewUsername.frame.size.height = 50
        //viewUsername.frame.size.width =
        //Placeholder
        username.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        
        //config Text Field Password
        //font
        password.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        password.font = UIFont(name: "Avenir Next", size: 20)
        //text color
        password.textColor = .white
        //Background
        //border color 241, 123, 30
        viewPassword.layer.borderColor = UIColor(red: 241/255, green: 123/255, blue: 30/255, alpha: 1).cgColor
        viewPassword.layer.borderWidth = 1
        //Corner
        viewPassword.layer.cornerRadius = 25
        //Height, Width
        viewPassword.frame.size.height = 50
        //viewUsername.frame.size.width =
        password.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        //config btnLogin
        //title
        btnLogin.backgroundColor = UIColor(red: 240/255, green: 119/255, blue: 37/255, alpha: 1)
//        btnLogin.setTitle("Log In", for: .normal)
        btnLogin.tintColor = UIColor(white: 1, alpha: 1)
        //border
        btnLogin.layer.cornerRadius = 25
        
        
        //footer
        //sign up 238, 130, 19
        btnSignUp.backgroundColor = .clear
        btnSignUp.tintColor = UIColor(red: 238/255, green: 130/255, blue: 19/255, alpha: 1)
        
        //footer View
    }
    
    @IBAction func btnLoginClick(_ sender: Any) {
        
        loginViewModel.login(/*username: username, password: password*/) { (done) in
            if done {
                print(done)
                print("ĐĂNG NHẬP THÀNH CÔNG")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let signUpVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                    signUpVC.navigationItem.hidesBackButton = true
                    self.navigationController?.pushViewController(signUpVC, animated: true)
                }
            }
            else {
                print(done)
                print("ĐĂNG NHẬP THẤT BẠI")
                let alertVC = UIAlertController(title: "Thất bại!", message: "Đăng nhập thất bại", preferredStyle: .alert)
                let action1: UIAlertAction = UIAlertAction(title: "Thử lại", style: UIAlertAction.Style.default) { (_) in
                }
                alertVC.addAction(action1)
                alertVC.modalPresentationStyle = .overFullScreen
                self.present(alertVC, animated: true, completion: nil)
            }
        }
        loginViewModel.username.onNext(username.text ?? "")
        loginViewModel.password.onNext(password.text ?? "")
    }
    
    @IBAction func btnSignUpVC(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let signUpVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
            signUpVC.navigationItem.hidesBackButton = true
            navigationController?.pushViewController(signUpVC, animated: true)
        }
    }

}
