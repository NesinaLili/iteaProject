//
//  ProgramTypeCourseViewController.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/30/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class ProgramTypeCourseViewController: UIViewController {
    @IBOutlet weak var programCourseTextView: UITextView!
    
    var nameTypesProgram: [TypeCourses] = []
    var indexProgram: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        programCourseTextView.text = nameTypesProgram[indexProgram].program
        programCourseTextView.backgroundColor = UIColor.clear
    }

    @IBAction func didTapBackViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
