//
//  Cources.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/21/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import Foundation
import UIKit

class Courses {
    var fotoCourses: String
    var nameCourses: String
    var trainingCourses: String
    var typeTrainingCourses: String
    var nameTypeCourses: [TypeCourses]
    init(fotoCourses: String, nameCourses: String, trainingCourses: String, typeTrainingCourses: String, nameTypeCourses: [TypeCourses]) {
        self.fotoCourses = fotoCourses
        self.nameCourses = nameCourses
        self.trainingCourses = trainingCourses
        self.typeTrainingCourses = typeTrainingCourses
        self.nameTypeCourses = nameTypeCourses
    }
}
