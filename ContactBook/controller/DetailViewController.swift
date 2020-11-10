//
//  DetailViewController.swift
//  ContactBook
//
//  Created by Магжан Имангазин on 9/23/20.
//  Copyright © 2020 Магжан Имангазин. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var name_surname: String?
    var gpa: String?
    var image: UIImage?
    
    var index = 0
    
    var myProtocol: UserProtocol?
    
    @IBOutlet weak var nameSurnameText: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var imageLabel: UIImageView!
    
    @IBAction func editPressed(_ sender: UIBarButtonItem) {
        nameSurnameText.isEnabled = true
        phoneNumberText.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSurnameText.text = name_surname
        phoneNumberText.text = gpa
        imageLabel.image = image
        nameSurnameText.delegate = self
        phoneNumberText.delegate = self
        nameSurnameText.isEnabled = false
        phoneNumberText.isEnabled = false
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        myProtocol?.changeUser(nameSurname: nameSurnameText.text!, phoneNumber: phoneNumberText.text!, index: index)
        navigationController?.popViewController(animated: true)
    }
    
}

extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
