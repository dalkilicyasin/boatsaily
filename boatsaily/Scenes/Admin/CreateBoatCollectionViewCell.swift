//
//  CreateBoatCollectionViewCell.swift
//  boatsaily
//
//  Created by yasin on 28.07.2024.
//

import UIKit

class CreateBoatCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var addImageView: UIImageView!
    @IBOutlet weak var addImageTopView: UIView!
    static let idenifier = "CreateBoatCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addImageTopView.layer.borderWidth = 1
        self.addImageTopView.layer.borderColor = UIColor.darkGray.cgColor
        self.addImageTopView.layer.cornerRadius = 8
        
        self.addImageView.layer.cornerRadius = 8
    }
    
    public func configure(with image: UIImage) {
        self.addImageView.image = image
     }
    
    static func nib() -> UINib {
       return UINib(nibName: "CreateBoatCollectionViewCell", bundle: nil)
    }

}
