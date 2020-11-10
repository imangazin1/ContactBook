//
//  ViewController.swift
//  ContactBook
//
//  Created by Магжан Имангазин on 9/22/20.
//  Copyright © 2020 Магжан Имангазин. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var students = [Student.init("Wasya Pupkin", "87771234567", UIImage.init(named: "female")!),
                    Student.init("Akzhol Imangazin", "87022346598", UIImage.init(named: "male")!)
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.studentName.text = students[indexPath.row].name_surname
        cell?.studentGpa.text = students[indexPath.row].gpa
        cell?.studentImageView.image = students[indexPath.row].image
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    
        navigationController?.pushViewController(detailVC, animated: true)
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBOutlet weak var myTableView: UITableView!
        
    @IBAction func Pressed(_ sender: UIBarButtonItem) {
        let addVC = self.storyboard?.instantiateViewController(withIdentifier: "CreateViewController") as! CreateViewController
        addVC.myProtocol = self
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = (myTableView.indexPathForSelectedRow?.row)!
        let destination = segue.destination as! DetailViewController
        destination.name_surname = students[index].name_surname
        destination.gpa = students[index].gpa
        destination.image = students[index].image
        destination.myProtocol = self
        destination.index = index
    }
}

extension ViewController: UserProtocol {

    func addUser(nameSurname: String, phoneNumber: String, gender: Gender) {
        let newUser = Student.init(nameSurname, phoneNumber, gender == .male ? UIImage.init(named: "male")! : UIImage.init(named: "female")!)
        students.append(newUser)
        myTableView.reloadData()
    }
    func changeUser(nameSurname: String, phoneNumber: String, index: Int) {
        students[index].name_surname = nameSurname
        students[index].gpa = phoneNumber
        myTableView.reloadData()
    }
}
