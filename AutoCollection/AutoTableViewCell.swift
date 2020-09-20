//
//  AutoTableViewCell.swift
//  AutoCollection
//
//  Created by Станислав Белоусов on 19/09/2020.
//  Copyright © 2020 Станислав Белоусов. All rights reserved.
//

import UIKit

class AutoTableViewCell: UITableViewCell {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    
    func setCar (car:Auto) {
        self.brandLabel.text = car.brand
        self.modelLabel.text = car.model
        self.yearLabel.text = car.year
        self.emojiLabel.text = car.typeEmoji
        self.typeLabel.text = car.type
    }

}
