//
//  OptionsViewModel.swift
//  Examen
//
//  Created by Pedro Antonio Vazquez Rodriguez on 24/09/20.
//  Copyright © 2020 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

var selectedOptionsArray: [MainModel] = []


//class OptionsViewModelItem {
//    var item: MainModel
//    
//    var title: String {
//        return item.title
//    }
//    
//    init(item: MainModel) {
//        self.item = item
//    }
//}
//
//class OptionsViewModel: NSObject {
//    var items = [OptionsViewModelItem]()
//
//    override init() {
//        super.init()
//        items = selectedOptionsArray.map {OptionsViewModelItem(item: $0)}
//    }
//}
//
//extension OptionsViewModel: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: OptionsTableViewCell().identifier, for: indexPath) as? OptionsTableViewCell {
//            cell.item = items[indexPath.row]
//            
//            
//            return cell
//        }
//        return UITableViewCell()
//    }
//}
//
//extension OptionsViewModel: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let identifier = items[indexPath.row].title
//         performSegue(withIdentifier: identifier, sender: nil)
//      
//    }
//
//
//}
//
