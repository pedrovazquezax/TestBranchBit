//
//  GenderViewModel.swift
//  Examen
//
//  Created by Pedro Antonio Vazquez Rodriguez on 24/09/20.
//  Copyright © 2020 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

var gendersArray : [GenderModel] = [GenderModel(title: "Femenino"),GenderModel(title: "Masculino")]


class GenderViewModelItem {
     var item: GenderModel
    
    var isSelected = false
    
    var title: String {
        return item.title
    }
    
    init(item: GenderModel) {
        self.item = item
    }
}

class GenderViewModel: NSObject {
    var items = [GenderViewModelItem]()
    
    
    var selectedItem: [GenderViewModelItem] {
        return items.filter { return $0.isSelected }
    }
    
    override init() {
        super.init()
        items = gendersArray.map { GenderViewModelItem(item: $0) }
    }
}

extension GenderViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: GenderTableViewCell().identifier, for: indexPath) as? GenderTableViewCell {
            cell.item = items[indexPath.row]
            if items[indexPath.row].isSelected {
                if !cell.isSelected {
                    tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
                }
            } else {
                if cell.isSelected {
                    tableView.deselectRow(at: indexPath, animated: false)
                }
            }
            
            return cell
        }
        return UITableViewCell()
    }
}

extension GenderViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].isSelected = true
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        items[indexPath.row].isSelected = false

    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
}
