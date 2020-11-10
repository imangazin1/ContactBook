//
//  CreateViewController.swift
//  ContactBook
//
//  Created by Магжан Имангазин on 9/23/20.
//  Copyright © 2020 Магжан Имангазин. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    var myProtocol: UserProtocol?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var myPickerView: UIPickerView!
    
    var arr = ["Male", "Female"]
    var gender: Gender = .male
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerView.delegate = self
        myPickerView.dataSource = self
        nameTextField.delegate = self
        phoneTextField.delegate = self
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        myProtocol?.addUser(nameSurname: nameTextField.text!, phoneNumber: phoneTextField.text!, gender: gender)
        navigationController?.popViewController(animated: true)
    }
}

extension CreateViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }
}

extension CreateViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let result = arr[row]
        if result == "Male" {
            gender = .male
        } else {
            gender = .female
        }
    }
}

extension CreateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
