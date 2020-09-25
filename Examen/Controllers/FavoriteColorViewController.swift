//
//  FavoriteColorViewController.swift
//  Examen
//
//  Created by Pedro Antonio Vazquez Rodriguez on 24/09/20.
//  Copyright © 2020 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class FavoriteColorViewController: UIViewController {


    @IBOutlet var colorsTableView: UITableView!
    let colorsViewModel = ColorViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        colorsTableView?.register(UINib(nibName: "ColorTableViewCell", bundle: nil), forCellReuseIdentifier: ColorTableViewCell().identifier)
        colorsTableView?.estimatedRowHeight = 70
        colorsTableView?.rowHeight = 70
        colorsTableView?.allowsMultipleSelection = true
        colorsTableView?.dataSource = colorsViewModel
        colorsTableView?.delegate = colorsViewModel
        colorsTableView?.separatorStyle = .singleLine
        colorsTableView?.isScrollEnabled = false
    }
    


}
