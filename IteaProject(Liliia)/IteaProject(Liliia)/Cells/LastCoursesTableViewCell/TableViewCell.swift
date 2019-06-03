//
//  TableViewCell.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/22/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var fotoLastCourseImage: UIImageView!
    @IBOutlet weak var nameLastCourseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
