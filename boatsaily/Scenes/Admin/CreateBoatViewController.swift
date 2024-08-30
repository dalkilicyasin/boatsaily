//
//  CreateBoatViewController.swift
//  boatsaily
//
//  Created by yasin on 25.07.2024.
//

import UIKit
import Foundation

class CreateBoatViewController: UIViewController, Storyboarded {
    
    var coordinator: CreateBoatCoordinator?
    let viewModel: CreateBoatViewModel
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var giveInformationTextView: UITextView!
    @IBOutlet weak var tourNameText: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var townText: UITextField!
    @IBOutlet weak var departureText: UITextField!
    @IBOutlet weak var arrivedText: UITextField!
    @IBOutlet weak var extrasText: UITextField!
    @IBOutlet weak var notesText: UITextView!
    
    var imageList: [UIImage] = []
    var savedImageList: [UIImage] = []
    var selectedImageNumber = 0
    var unselectedImageNumber = 4
    
    
    public init(viewModel: CreateBoatViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = CreateBoatViewModel()
       super.init(coder: aDecoder)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Create Boat"
       
        //collectionView register
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        self.collectionView.collectionViewLayout = layout
        
        self.collectionView.register(CreateBoatCollectionViewCell.nib(), forCellWithReuseIdentifier: CreateBoatCollectionViewCell.idenifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.saveButton.layer.cornerRadius = 8
        
        self.giveInformationTextView.layer.borderWidth = 0.5
        self.giveInformationTextView.layer.borderColor = UIColor.lightGray.cgColor
        self.giveInformationTextView.layer.cornerRadius = 8
    }
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    

    @IBAction func addImageButtonTapped(_ sender: Any) {
        guard self.unselectedImageNumber > 0 else {return}
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func removeImage() {
        if self.selectedImageNumber > 0 && self.unselectedImageNumber < 5 {
            self.selectedImageNumber -= 1
            self.unselectedImageNumber += 1
            self.imageList.remove(at: self.selectedImageNumber)
            self.collectionView.reloadData()
        }else {
            return
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.viewModel.tourName = self.tourNameText.text ?? ""
        self.viewModel.city = self.cityText.text ?? ""
        self.viewModel.town = self.townText.text ?? ""
        self.viewModel.departureTime = self.departureText.text ?? ""
        self.viewModel.arrivedTime = self.arrivedText.text ?? ""
        self.viewModel.extras = self.extrasText.text ?? ""
        self.viewModel.notes = self.notesText.text ?? ""
        self.viewModel.images = self.savedImageList
        
        guard !viewModel.tourName.elementsEqual(""), !self.viewModel.city.elementsEqual(""), !viewModel.images.isEmpty else {
            showAlert(title: "Error", message: "Please be sure upload photo and filled tour informations")
            return
        }
        self.viewModel.saveBoatInformations()
        
        self.showAlert(title: "Success", message: "Your Data Has Been Saved")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension CreateBoatViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateBoatCollectionViewCell.idenifier, for: indexPath) as! CreateBoatCollectionViewCell
        if !imageList.isEmpty {
            cell.configure(with: self.imageList[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
        }
}


extension CreateBoatViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            self.imageList.insert(image, at: selectedImageNumber)
            self.savedImageList.insert(image, at: selectedImageNumber)
            self.selectedImageNumber += 1
            self.unselectedImageNumber -= 1
        }
        
        picker.dismiss(animated: true) {
            for _ in 0...(self.unselectedImageNumber) {
                self.imageList.append(UIImage(named: "addphoto") ?? UIImage())
            }
            self.collectionView.reloadData()
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
