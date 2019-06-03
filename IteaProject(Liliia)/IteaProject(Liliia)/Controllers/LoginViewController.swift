//
//  LoginViewController.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/8/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var forgotPasswordButtonOutlet: UIButton!
    @IBOutlet weak var showPasswordButtonOutlet: UIButton!
    @IBOutlet weak var hintLabel: UILabel!
    
    var isShowPassword: Bool = false
    var arrayUser = UserManager().UserArray
    var arrayCoursesLogin = CoursesManager().CourseArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameText.delegate = self
        passwordText.delegate = self
        
        usernameText.backgroundColor = UIColor.clear
        passwordText.backgroundColor = UIColor.clear
        
        passwordText.isSecureTextEntry = true
        
        buttonEdit(button: loginButtonOutlet)
        buttonEdit(button: forgotPasswordButtonOutlet)
        
        changePasswordShowing(isShowPassword: isShowPassword)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameText.resignFirstResponder()
        passwordText.resignFirstResponder()
    }

    @IBAction func loginButton(_ sender: Any) {
        if (usernameText.text != arrayUser[0].loginUser && usernameText.text != "") {
            Alert(info: "Введен неправильный логин!")
        }
        if (passwordText.text != arrayUser[0].passwordUser && passwordText.text != "") {
            Alert(info: "Введен неправильный пароль!")
        }
        if usernameText.text == "" {
           Alert(info: "Введите логин!")
        }
        if passwordText.text == "" {
            Alert(info: "Введите пароль!")
        }
        if (usernameText.text == arrayUser[0].loginUser && passwordText.text == arrayUser[0].passwordUser) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CourseViewController") as! CourseViewController
          self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func showPassword(_ sender: Any) {
        isShowPassword = !isShowPassword
        changePasswordShowing(isShowPassword: isShowPassword)
    }
    
    @IBAction func didTapForgotPassword(_ sender: Any) {
        hintLabel.text = "Подсказка: " + "творческий псевдоним"
    }
    func changePasswordShowing(isShowPassword: Bool) {
        if passwordText.text != "" {
        if !isShowPassword  {
            passwordText.isSecureTextEntry = true
            showPasswordButtonOutlet.setTitle("ПОКАЗАТЬ ПАРОЛЬ", for: .normal)
        } else {
            passwordText.isSecureTextEntry = false
            showPasswordButtonOutlet.setTitle("СКРЫТЬ ПАРОЛЬ", for: .normal)
            }
        }
    }
    
    func buttonEdit(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
    }
    
    func Alert(info: String) {
        let alert = UIAlertController(title: "Ошибка 😔", message: info, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Повторить еще раз", style: .default, handler: nil))
        self.present(alert,animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
