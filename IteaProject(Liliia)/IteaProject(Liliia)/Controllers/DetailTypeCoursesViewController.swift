//
//  DetailTypeCoursesViewController.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/30/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class DetailTypeCoursesViewController: UIViewController {
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var afterCourseTextView: UITextView!
    @IBOutlet weak var programCourseButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    var nameTypesDetail: [TypeCourses] = []
    var indexDetail: Int = 0
    var nameCourse: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonEdit(button: programCourseButton)
        buttonEdit(button: signUpButton)
        aboutTextView.backgroundColor = UIColor.clear
        aboutTextView.text = nameTypesDetail[indexDetail].discription
        afterCourseTextView.text = nameTypesDetail[indexDetail].afterCourse
    }
    
    func buttonEdit(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
    }
    
    @IBAction func didTapBackViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapProgramTypeCourseViewController(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProgramTypeCourseViewController") as! ProgramTypeCourseViewController
        vc.nameTypesProgram = nameTypesDetail
        vc.indexProgram = indexDetail
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapSignUpViewController(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        vc.nameCourse = nameCourse
        navigationController?.pushViewController(vc, animated: true)
    }
}
