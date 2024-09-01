//
//  AdminBoatListDetailViewController.swift
//  boatsaily
//
//  Created by yasin on 17.08.2024.
//

import UIKit

class AdminBoatListDetailViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tourNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var townLabel: UILabel!
    @IBOutlet weak var arrivedTimeLabel: UILabel!
    @IBOutlet weak var departureTimeLabel: UILabel!
    
    let viewModel: AdminBoatListDetailViewModel
    
    init( viewModel: AdminBoatListDetailViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = AdminBoatListDetailViewModel()
       super.init(coder: aDecoder)
    }
    
    var coordinator: AdminBoatListDetailCoordinator?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.viewModel.getDetailInfo()
        
        self.collectionView.register(AdminBoatListDetailCollectionViewCell.nib(), forCellWithReuseIdentifier: AdminBoatListDetailCollectionViewCell.identifier)
        self.pageControl.numberOfPages = viewModel.boatInformation.imageData.count
        
        self.tourNameLabel.text = viewModel.boatInformation.tourName
        self.cityLabel.text = viewModel.boatInformation.city
        self.townLabel.text = viewModel.boatInformation.town
        self.arrivedTimeLabel.text = viewModel.boatInformation.arrivedTime
        self.departureTimeLabel.text = viewModel.boatInformation.departureTime
    }
}


extension AdminBoatListDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.boatInformation.imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdminBoatListDetailCollectionViewCell.identifier, for: indexPath) as! AdminBoatListDetailCollectionViewCell
        cell.configure(with: UIImage(data: self.viewModel.boatInformation.imageData[indexPath.row] ) ?? UIImage())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
}
