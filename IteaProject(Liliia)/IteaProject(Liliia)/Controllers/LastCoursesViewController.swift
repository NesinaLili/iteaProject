//
//  LastCoursesViewController.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/8/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class LastCoursesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var arrayLastCourses = CoursesManager().CourseArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.reloadData()
    }
    
    @IBAction func didTapBackController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension LastCoursesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if indexPath.row == 0 {
            cell.fotoLastCourseImage.image = UIImage(named: arrayLastCourses[15].fotoCourses)
            cell.nameLastCourseLabel.text = arrayLastCourses[15].nameTypeCourses[0].nameTypeCourses
        } else {
            cell.fotoLastCourseImage.image = UIImage(named: arrayLastCourses[15].fotoCourses)
            cell.nameLastCourseLabel.text = arrayLastCourses[15].nameTypeCourses[1].nameTypeCourses
        }
        cell.backgroundColor = UIColor.clear
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailTypeCoursesViewController") as! DetailTypeCoursesViewController
        vc.indexDetail = indexPath.row
        vc.nameTypesDetail = arrayLastCourses[15].nameTypeCourses
        tableView.reloadData()
         navigationController?.pushViewController(vc, animated: true)
    }
}
