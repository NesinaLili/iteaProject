//
//  TypeTableViewCell.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/29/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class TypeTableViewCell: UITableViewCell {
    @IBOutlet weak var typeCoursesView: UIView!
    @IBOutlet weak var nameTypeCoursesLabel: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        typeCoursesView.clipsToBounds = true
        typeCoursesView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
