//
//  CustomCell.swift
//  ContactBook
//
//  Created by Магжан Имангазин on 9/23/20.
//  Copyright © 2020 Магжан Имангазин. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentGpa: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
