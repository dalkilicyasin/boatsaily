//
//  BoatListTableViewCell.swift
//  boatsaily
//
//  Created by yasin on 4.09.2024.
//

import UIKit

class BoatListTableViewCell: UITableViewCell {
    
    static let identifier = "BoatListTableViewCell"
    @IBOutlet weak var cityTownLabel: UILabel!
    @IBOutlet weak var tourNameLabel: UILabel!
    @IBOutlet weak var tourDateLabel: UILabel!
    @IBOutlet weak var arrivedTime: UILabel!
    @IBOutlet weak var departureTime: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var infolistStackView: UIStackView!
    @IBOutlet weak var mainStackView: UIStackView!
    var imageDataList: [Data] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.mainStackView.layer.cornerRadius = 8
        self.mainStackView.layer.borderWidth = 0.5
        self.mainStackView.layer.borderColor = UIColor.gray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "BoatListTableViewCell", bundle: nil)
    }
    
    func configure(model: BoatInformationDetailList) {
        self.tourNameLabel.text = "\(model.tourName ?? "")"
        self.cityTownLabel.text = "Location: \(model.city ?? "")/\(model.town ?? "")"
        self.tourDateLabel.text = "Tour Date: \(model.tourDate ?? "")"
        self.arrivedTime.text = "Arrived Time: \(model.arrivedTime ?? "")"
        self.departureTime.text = "Departure Time: \(model.departureTime ?? "")"
        self.imageDataList = model.imageData
        
        self.collectionView.register(AdminBoatListDetailCollectionViewCell.nib(), forCellWithReuseIdentifier: AdminBoatListDetailCollectionViewCell.identifier)
        self.pageControl.numberOfPages = model.imageData.count
    }
}


extension BoatListTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdminBoatListDetailCollectionViewCell.identifier, for: indexPath) as! AdminBoatListDetailCollectionViewCell
        cell.configure(with: UIImage(data: self.imageDataList[indexPath.row] ) ?? UIImage())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
}
