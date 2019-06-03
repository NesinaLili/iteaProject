//
//  NameCourses.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/29/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import Foundation

class TypeCourses {
    var nameTypeCourses: String
    var discription: String
    var afterCourse: String
    var program: String
    init(nameTypeCourses: String, discription: String, afterCourse: String, program: String) {
        self.nameTypeCourses = nameTypeCourses
        self.discription = discription
        self.afterCourse = afterCourse
        self.program = program
    }
}
