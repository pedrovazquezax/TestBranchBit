//
//  MainTableViewCell.swift
//  Examen
//
//  Created by Pedro Antonio Vazquez Rodriguez on 24/09/20.
//  Copyright © 2020 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    let mainCellIdentifier = "mainCell"
    
    var item: MainViewModelItem? {
        didSet {
            titleLabel?.text = item?.title
        }
    }

    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
      accessoryType = selected ? .checkmark : .none
  }
    
}
