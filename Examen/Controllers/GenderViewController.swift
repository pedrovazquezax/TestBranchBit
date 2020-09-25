//
//  GenderViewController.swift
//  Examen
//
//  Created by Pedro Antonio Vazquez Rodriguez on 24/09/20.
//  Copyright © 2020 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class GenderViewController: UIViewController {

    @IBOutlet var GenderTableView: UITableView!
    @IBOutlet var selectedGender: UILabel!
    let gendersViewModel = GenderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GenderTableView?.register(UINib(nibName: "GenderTableViewCell", bundle: nil), forCellReuseIdentifier:GenderTableViewCell().identifier)
        GenderTableView?.estimatedRowHeight = 70
        GenderTableView?.rowHeight = 70
        GenderTableView?.allowsMultipleSelection = false
        GenderTableView?.dataSource = gendersViewModel
        GenderTableView?.delegate = gendersViewModel
        GenderTableView?.separatorStyle = .singleLine
        GenderTableView?.isScrollEnabled = false
    }
    

}
