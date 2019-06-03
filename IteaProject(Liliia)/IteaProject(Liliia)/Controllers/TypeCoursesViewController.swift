//
//  TypeCoursesViewController.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/29/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class TypeCoursesViewController: UIViewController {
    @IBOutlet weak var nameCourseLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var nameTypes: [TypeCourses] = []
    var nameCourse: String = ""
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameCourseLabel.text = nameCourse
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.register(UINib(nibName: "TypeTableViewCell", bundle: nil), forCellReuseIdentifier: "TypeTableViewCell")
        tableView.reloadData()
    }
    
    @IBAction func didTapBackViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension TypeCoursesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TypeTableViewCell", for: indexPath) as! TypeTableViewCell
        cell.backgroundColor = UIColor.clear
        cell.nameTypeCoursesLabel.text = nameTypes[indexPath.row].nameTypeCourses
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        index = indexPath.row
        tableView.reloadData()
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailTypeCoursesViewController") as! DetailTypeCoursesViewController
        vc.nameCourse = nameCourse
        vc.nameTypesDetail = nameTypes
        vc.indexDetail = index
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
