//
//  SignUpViewController.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/30/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameCourseLabel: UILabel!
    @IBOutlet weak var nameStudentTextField: UITextField!
    @IBOutlet weak var surnameStudentTextField: UITextField!
    @IBOutlet weak var emailStudentTextField: UITextField!
    @IBOutlet weak var phoneStudentTextField: UITextField!
    
    @IBOutlet weak var outsideRightView: UIView!
    @IBOutlet weak var insideRightView: UIView!
    
    @IBOutlet weak var outsideLeftView: UIView!
    @IBOutlet weak var insideLeftView: UIView!
    
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBOutlet weak var outsideAgreeView: UIView!
    @IBOutlet weak var insideAgreeImage: UIImageView!
    
    @IBOutlet weak var agreetextView: UITextView!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    var nameCourse: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameCourseLabel.text = nameCourse
        agreetextView.backgroundColor = UIColor.clear
        
        outsideAgreeView.layer.borderWidth = 1
        outsideAgreeView.layer.borderColor = UIColor.lightGray.cgColor
        commentTextView.layer.borderWidth = 1
        commentTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        buttonEdit(button: signUpButton)
        editViews()
        
        nameStudentTextField.delegate = self
        surnameStudentTextField.delegate = self
        emailStudentTextField.delegate = self
        phoneStudentTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameStudentTextField.resignFirstResponder()
        surnameStudentTextField.resignFirstResponder()
        emailStudentTextField.resignFirstResponder()
        phoneStudentTextField.resignFirstResponder()
        commentTextView.resignFirstResponder()
    }
    
    @IBAction func didTapBackViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {
        if (nameStudentTextField.text  == "" || surnameStudentTextField.text == "" || emailStudentTextField.text == "" || phoneStudentTextField.text == "" ) || (insideRightView.isHidden == true && insideLeftView.isHidden == true) {
            Alert(info: "Не заполнены обязательные поля", title1: "Ошибка 😔", title2: "Повторить еще раз")
        } else if insideAgreeImage.isHidden == true {
            outsideAgreeView.layer.borderWidth = 1
            outsideAgreeView.layer.borderColor = UIColor.red.cgColor
        } else {
            AlertClose(info: "Заявка принята. Ожидайте звонка)", title1: "Поздравляем 😊", title2: "Готово")
        }
    }
    
    @IBAction func didTapRightView(_ sender: Any) {
        if insideRightView.isHidden == false {
            insideRightView.isHidden = true
            insideLeftView.isHidden = false
        } else {
            insideRightView.isHidden = false
            insideLeftView.isHidden = true
        }
    }
    @IBAction func didTapLeftView(_ sender: Any) {
        if insideLeftView.isHidden == false {
            insideLeftView.isHidden = true
            insideRightView.isHidden = false
        } else {
            insideLeftView.isHidden = false
            insideRightView.isHidden = true
        }
    }
    @IBAction func didTapAgree(_ sender: Any) {
        if insideAgreeImage.isHidden == false {
            insideAgreeImage.isHidden = true
        } else {
           insideAgreeImage.isHidden = false
        }
    }
 
    func buttonEdit(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
    }
    
    func editViews() {
        outsideRightView.layer.cornerRadius = outsideRightView.frame.size.width / 2
        outsideRightView.clipsToBounds = true
        outsideRightView.layer.borderWidth = 1
        outsideRightView.layer.borderColor = UIColor.lightGray.cgColor
        
        insideRightView.layer.cornerRadius = insideRightView.frame.size.width / 2
        insideRightView.clipsToBounds = true
        
        outsideLeftView.layer.cornerRadius = outsideLeftView.frame.size.width / 2
        outsideLeftView.clipsToBounds = true
        outsideLeftView.layer.borderWidth = 1
        outsideLeftView.layer.borderColor = UIColor.lightGray.cgColor
        
        insideLeftView.layer.cornerRadius = insideLeftView.frame.size.width / 2
        insideLeftView.clipsToBounds = true
    }
    
    func someHandler(alert: UIAlertAction!) {
        navigationController?.popViewController(animated: true)
        
    }
    
    func Alert(info: String, title1: String, title2: String) {
        let alert = UIAlertController(title: title1, message: info, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: title2, style: .default, handler: nil))
        self.present(alert,animated: true)
    }
    
    func AlertClose(info: String, title1: String, title2: String) {
        let alert = UIAlertController(title: title1, message: info, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: title2, style: .default, handler: someHandler))
        self.present(alert,animated: true)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
