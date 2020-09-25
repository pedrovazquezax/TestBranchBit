//
//  OptionsViewController.swift
//  Examen
//
//  Created by Pedro Antonio Vazquez Rodriguez on 24/09/20.
//  Copyright © 2020 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {

    @IBOutlet var selectedOptionsTableView: UITableView!
    var options = selectedOptionsArray
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedOptionsTableView?.register(UINib(nibName: "OptionsTableViewCell", bundle: nil), forCellReuseIdentifier: OptionsTableViewCell().identifier)
        selectedOptionsTableView?.estimatedRowHeight = 70
        selectedOptionsTableView?.rowHeight = 70
        selectedOptionsTableView?.dataSource = self
        selectedOptionsTableView?.delegate = self
        selectedOptionsTableView?.separatorStyle = .singleLine
        selectedOptionsTableView?.isScrollEnabled = false
        selectedOptionsTableView?.allowsMultipleSelection = false
    }
    
}

extension OptionsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if let cell = tableView.dequeueReusableCell(withIdentifier: OptionsTableViewCell().identifier, for: indexPath) as? OptionsTableViewCell {
            cell.selectionStyle = .none
            cell.item = options[indexPath.row]
            
            return cell
         }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = options[indexPath.row].title
         performSegue(withIdentifier: identifier, sender: nil)
      
    }
    
    
}
