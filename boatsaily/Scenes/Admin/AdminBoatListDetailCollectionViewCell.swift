//
//  AdminBoatListDetailCollectionViewCell.swift
//  boatsaily
//
//  Created by yasin on 17.08.2024.
//

import UIKit

class AdminBoatListDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var sliderImageView: UIImageView!

    static let identifier = "AdminBoatListDetailCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image: UIImage) {
        
        self.sliderImageView.image = image
       
     }
    
    static func nib() -> UINib {
        return UINib(nibName: "AdminBoatListDetailCollectionViewCell", bundle: nil)
    }

}
