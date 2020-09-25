//
//  FavoriteColorViewModel.swift
//  Examen
//
//  Created by Pedro Antonio Vazquez Rodriguez on 24/09/20.
//  Copyright © 2020 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit
var colors : [FavoriteColorModel] = [FavoriteColorModel(colorName: "Verde"),FavoriteColorModel(colorName: "Azul"),FavoriteColorModel(colorName: "Amarrillo"),FavoriteColorModel(colorName: "Rojo"),FavoriteColorModel(colorName: "Blanco")]


class ColorViewModelItem {
     var item: FavoriteColorModel
    
    var isSelected = false
    
    var title: String {
        return item.colorName
    }
    
    init(item: FavoriteColorModel) {
        self.item = item
    }
}

class ColorViewModel: NSObject {
    var items = [ColorViewModelItem]()
    
    var didToggleSelection: ((_ hasSelection: Bool) -> ())? {
        didSet {
            didToggleSelection?(!selectedItems.isEmpty)
        }
    }
    
    var selectedItems: [ColorViewModelItem] {
        return items.filter { return $0.isSelected }
    }
    
    override init() {
        super.init()
        items =  colors.map { ColorViewModelItem(item: $0) }
    }
}

extension ColorViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ColorTableViewCell().identifier, for: indexPath) as? ColorTableViewCell {
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

extension ColorViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].isSelected = true
        
        didToggleSelection?(!selectedItems.isEmpty)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        items[indexPath.row].isSelected = false
        didToggleSelection?(!selectedItems.isEmpty)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
}
