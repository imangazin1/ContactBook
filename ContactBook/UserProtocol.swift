//
//  UserProtocol.swift
//  ContactBook
//
//  Created by Магжан Имангазин on 9/24/20.
//  Copyright © 2020 Магжан Имангазин. All rights reserved.
//

import Foundation

protocol UserProtocol {
    func addUser(nameSurname: String, phoneNumber: String, gender: Gender)
    func changeUser(nameSurname: String, phoneNumber: String, index: Int)
}
