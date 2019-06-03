//
//  User.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/22/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import Foundation
import UIKit

class User {
    var loginUser: String
    var passwordUser: String
    var avatarUser: String
    var nameUser: String
    var surnameUser: String
    var ageUser: String
    var cityUser: String
    var birthdayUser: String
    var emailUser: String
    var phoneUser: String
    var currentCourse: String
    var workPlace: String
    
    init(loginUser: String, passwordUser: String, avatarUser: String, nameUser: String, surnameUser: String, ageUser: String, cityUser: String, birthdayUser: String, emailUser: String, phoneUser: String, currentCourse: String, workPlace: String) {
        self.loginUser = loginUser
        self.passwordUser = passwordUser
        self.avatarUser = avatarUser
        self.nameUser = nameUser
        self.surnameUser = surnameUser
        self.ageUser = ageUser
        self.cityUser = cityUser
        self.birthdayUser = birthdayUser
        self.emailUser = emailUser
        self.phoneUser = phoneUser
        self.currentCourse = currentCourse
        self.workPlace = workPlace
    }
}
