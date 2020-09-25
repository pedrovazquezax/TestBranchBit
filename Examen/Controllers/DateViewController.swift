//
//  DateViewController.swift
//  Examen
//
//  Created by Pedro Antonio Vazquez Rodriguez on 24/09/20.
//  Copyright © 2020 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var pickerView: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.isEnabled = false
        pickerView.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)

        // Do any additional setup after loading the view.
    }

    @objc func datePickerChanged(picker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
         textField.text = dateFormatter.string(from: pickerView.date)
    }

}
