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
    
    }

}


extension AdminBoatListDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("\(self.viewModel.boatInformation.imageData.count)")
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
        0
    }
}
