//
//  BoatListTableViewCell.swift
//  boatsaily
//
//  Created by yasin on 4.09.2024.
//

import UIKit

class BoatListTableViewCell: UITableViewCell {
    
    static let identifier = "BoatListTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "BoatListTableViewCell", bundle: nil)
    }
    
}
