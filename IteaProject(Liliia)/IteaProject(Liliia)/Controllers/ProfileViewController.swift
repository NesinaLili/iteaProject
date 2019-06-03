//
//  ProfileViewController.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/8/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var lastCoursesButton: UIButton!
    
    @IBOutlet weak var avatarUserImage: UIImageView!
    @IBOutlet weak var nameUserTextField: UITextField!
    @IBOutlet weak var surnameUserTextField: UITextField!
    
    
    @IBOutlet weak var ageUserTextField: UITextField!
    @IBOutlet weak var cityUserTextField: UITextField!
    @IBOutlet weak var birthdayUserTextField: UITextField!
    @IBOutlet weak var emailUserTextField: UITextField!
    @IBOutlet weak var phoneUserTextField: UITextField!
    @IBOutlet weak var currentCourseUserTextField: UITextField!
    @IBOutlet weak var placeOfWorkUserTextField: UITextField!
    
    
    var arrayUserProfile = UserManager().UserArray
    var arrayCoursesProfile = CoursesManager().CourseArray
    //var nameTypesProfile: [TypeCourses] = []
    var nameTypesProfile: [Courses] = []
    var isChanceTextButton = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameUserTextField.delegate = self
        surnameUserTextField.delegate = self
        ageUserTextField.delegate = self
        cityUserTextField.delegate = self
        birthdayUserTextField.delegate = self
        emailUserTextField.delegate = self
        phoneUserTextField.delegate = self
        currentCourseUserTextField.delegate = self
        placeOfWorkUserTextField.delegate = self
        
        buttonEdit(button: editButton)
        buttonEdit(button: lastCoursesButton)
        self.avatarUserImage.clipsToBounds = true
        self.avatarUserImage.layer.cornerRadius = self.avatarUserImage.frame.size.width / 2
    
        self.avatarUserImage.layer.borderWidth = 3.0
        self.avatarUserImage.layer.borderColor = UIColor.white.cgColor
        
        self.avatarUserImage.image = UIImage(named: arrayUserProfile[0].avatarUser)
        self.nameUserTextField.text = arrayUserProfile[0].nameUser
        self.surnameUserTextField.text = arrayUserProfile[0].surnameUser
        self.ageUserTextField.text = arrayUserProfile[0].ageUser
        self.cityUserTextField.text = arrayUserProfile[0].cityUser
        self.birthdayUserTextField.text = arrayUserProfile[0].birthdayUser
        self.emailUserTextField.text = arrayUserProfile[0].emailUser
        self.phoneUserTextField.text = arrayUserProfile[0].phoneUser
        self.currentCourseUserTextField.text = arrayUserProfile[0].currentCourse
        self.placeOfWorkUserTextField.text = arrayUserProfile[0].workPlace
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameUserTextField.resignFirstResponder()
        surnameUserTextField.resignFirstResponder()
        ageUserTextField.resignFirstResponder()
        cityUserTextField.resignFirstResponder()
        birthdayUserTextField.resignFirstResponder()
        emailUserTextField.resignFirstResponder()
        phoneUserTextField.resignFirstResponder()
        currentCourseUserTextField.resignFirstResponder()
        placeOfWorkUserTextField.resignFirstResponder()
    }
    
    func buttonEdit(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
    }
    
    func textFieldEdit(abilityEdit: Bool) {
        nameUserTextField.isEnabled = abilityEdit
        surnameUserTextField.isEnabled = abilityEdit
        ageUserTextField.isEnabled = abilityEdit
        cityUserTextField.isEnabled = abilityEdit
        birthdayUserTextField.isEnabled = abilityEdit
        emailUserTextField.isEnabled = abilityEdit
        phoneUserTextField.isEnabled = abilityEdit
        currentCourseUserTextField.isEnabled = abilityEdit
        placeOfWorkUserTextField.isEnabled = abilityEdit
    }
    
    func borderTextField( width: Double, color: UIColor) {
        nameUserTextField.layer.borderWidth = CGFloat(width)
        nameUserTextField.layer.borderColor = color.cgColor
        
        surnameUserTextField.layer.borderWidth = CGFloat(width)
        surnameUserTextField.layer.borderColor = color.cgColor
        
        ageUserTextField.layer.borderWidth = CGFloat(width)
        ageUserTextField.layer.borderColor = color.cgColor
        
        cityUserTextField.layer.borderWidth = CGFloat(width)
        cityUserTextField.layer.borderColor = color.cgColor
        
        birthdayUserTextField.layer.borderWidth = CGFloat(width)
        birthdayUserTextField.layer.borderColor = color.cgColor
        
        emailUserTextField.layer.borderWidth = CGFloat(width)
        emailUserTextField.layer.borderColor = color.cgColor
        
        phoneUserTextField.layer.borderWidth = CGFloat(width)
        phoneUserTextField.layer.borderColor = color.cgColor
        
        currentCourseUserTextField.layer.borderWidth = CGFloat(width)
        currentCourseUserTextField.layer.borderColor = color.cgColor
        
        placeOfWorkUserTextField.layer.borderWidth = CGFloat(width)
        placeOfWorkUserTextField.layer.borderColor = color.cgColor
    }
    
    @IBAction func didTapEditButton(_ sender: Any) {
        if isChanceTextButton == false {
            editButton.setTitle("Сохранить", for: .normal)
            borderTextField(width: 0.5, color: UIColor.lightGray)
            textFieldEdit(abilityEdit: true)
            isChanceTextButton = true
        } else {
            editButton.setTitle("Редактировать", for: .normal)
            borderTextField(width: 0.5, color: UIColor.clear)
            textFieldEdit(abilityEdit: false)
            isChanceTextButton = false
        }
    }
    
    @IBAction func didTapLastCoursesButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LastCoursesViewController") as! LastCoursesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapBackViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
