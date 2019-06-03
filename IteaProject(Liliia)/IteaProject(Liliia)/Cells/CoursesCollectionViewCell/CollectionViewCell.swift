//
//  CollectionViewCell.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/21/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var fotoCourcesImage: UIImageView!
    @IBOutlet weak var nameCourcesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(course: Courses) {
        fotoCourcesImage.image = UIImage(named: course.fotoCourses)
        nameCourcesLabel.text = course.nameCourses
    }
}
