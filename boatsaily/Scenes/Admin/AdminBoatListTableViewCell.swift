//
//  AdminBoatListTableViewCell.swift
//  boatsaily
//
//  Created by yasin on 15.08.2024.
//

import UIKit

class AdminBoatListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var town: UILabel!
    
    static let idenifier = "AdminBoatListTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
       return UINib(nibName: "AdminBoatListTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(model: BoatInformationList) {
        self.title.text = model.tourName
        self.city.text = model.city
        self.town.text = model.town
    }
}
