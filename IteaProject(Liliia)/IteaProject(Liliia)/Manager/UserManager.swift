//
//  UzerManager.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/22/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import Foundation
import UIKit

class UserManager  {
    var UserArray: [User] = []
    init() {
        UserArray.append(User(loginUser: "lilia", passwordUser: "nesina", avatarUser: "userFoto", nameUser: "Лилия", surnameUser: "Несина", ageUser: "22 года ",cityUser: "Киев", birthdayUser: "17 июля 1997 год", emailUser: "lilianesina97@gmail.com", phoneUser: "+380997792763", currentCourse: "IOS base", workPlace: "Apple"))
    }
}
