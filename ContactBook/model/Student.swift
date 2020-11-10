//
//  Student.swift
//  ContactBook
//
//  Created by Магжан Имангазин on 9/22/20.
//  Copyright © 2020 Магжан Имангазин. All rights reserved.
//

import Foundation
import UIKit

class Student {
    var name_surname: String?
    var gpa: String?
    var image: UIImage?
    init(_ name_surname: String, _ gpa: String, _ image: UIImage) {
        self.name_surname = name_surname
        self.gpa = gpa
        self.image = image
    }
    
}
