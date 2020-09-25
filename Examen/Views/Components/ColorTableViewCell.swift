//
//  ColorTableViewCell.swift
//  Examen
//
//  Created by Pedro Antonio Vazquez Rodriguez on 24/09/20.
//  Copyright © 2020 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class ColorTableViewCell: UITableViewCell {

    let identifier = "colorCell"
    
    @IBOutlet var colorNameLabel: UILabel!
       
    var item: ColorViewModelItem? {
        didSet {
            colorNameLabel?.text = item?.title
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }
    
}
