//
//  ViewController.swift
//  Examen
//
//  Created by Pedro Antonio Vazquez Rodriguez on 24/09/20.
//  Copyright © 2020 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var optionsTableView: UITableView!
    var mainViewModel = MainViewModel()
    
       override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        optionsTableView?.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: MainTableViewCell().mainCellIdentifier)
        optionsTableView?.estimatedRowHeight = 70
        optionsTableView?.rowHeight = 70
        optionsTableView?.allowsMultipleSelection = true
        optionsTableView?.dataSource = mainViewModel
        optionsTableView?.delegate = mainViewModel
        optionsTableView?.separatorStyle = .singleLine
    
    }

    @IBAction func NextViewActionButton(_ sender: Any) {
        if mainViewModel.selectedItems.count == 0 {
            let alert = UIAlertController(title: "Error", message: "Selecciona al menos una opcion", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        }else{

            selectedOptionsArray = mainViewModel.selectedItems.map{$0.item}

        }
    }
    

}

