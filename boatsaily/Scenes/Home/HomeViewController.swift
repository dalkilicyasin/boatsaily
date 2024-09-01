//
//  HomeViewController.swift
//  boatsaily
//
//  Created by yasin on 19.07.2024.
//

import UIKit
import Foundation

class HomeViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var selectCityLabel: UITextField!
    @IBOutlet weak var selectTownLabel: UITextField!
    @IBOutlet weak var selectDateLabel: UITextField!
    
    let datePicker = UIDatePicker()
    let customCityPicker = UIPickerView()
    let customTownPicker = UIPickerView()
    var coordinator: HomeCoordinator?
    var viewModel: HomeViewModel
    
    
    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = HomeViewModel()
       super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Home"
        // Do any additional setup after loading the view.
    
        selectDateLabel.textAlignment = .center
        selectCityLabel.textAlignment = .center
        selectTownLabel.textAlignment = .center
               
        self.customCityPicker.delegate = self
        self.customCityPicker.dataSource = self
        
        self.customTownPicker.delegate = self
        self.customTownPicker.dataSource = self
        
        self.customCityPicker.tag = 0
        self.customTownPicker.tag = 1
        
        createDatePicker()
    }


    func createDatePicker() {
        let toolBarDatePicker = UIToolbar()
        let toolBarCustomPicker = UIToolbar()
        toolBarDatePicker.sizeToFit()
        toolBarCustomPicker.sizeToFit()
        
        let doneButtonDatePicker = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonAction))
        toolBarDatePicker.setItems([doneButtonDatePicker], animated: true)
        
        let doneButtonCustomPicker = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donButtonActionCustom))
        toolBarCustomPicker.setItems([doneButtonCustomPicker], animated: true)

        //Custom Picker
        
        selectCityLabel.inputAccessoryView = toolBarCustomPicker
        selectCityLabel.inputView = customCityPicker
        
        selectTownLabel.inputAccessoryView = toolBarCustomPicker
        selectTownLabel.inputView = customTownPicker
    
        
        
        //Date Picker
        selectDateLabel.inputAccessoryView = toolBarDatePicker
        selectDateLabel.inputView = datePicker
        
        datePicker.datePickerMode = .date
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
    }
    
    
    
    @objc func doneButtonAction() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        selectDateLabel.text = formatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
    @objc func donButtonActionCustom() {
        if viewModel.selectedTag == 0 {
            selectCityLabel.text = "\(viewModel.selectedCity)"
        }else {
            selectTownLabel.text = "\(viewModel.selectedTown)"
        }
        
        
        
        self.view.endEditing(true)
    }
    
}


extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            self.viewModel.selectedTag = 0
            return self.viewModel.cityList.count
        }else {
            viewModel.selectedTag = 1
            return self.viewModel.townList.count
        }
       
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            self.viewModel.selectedCity = self.viewModel.cityList[row]
            return self.viewModel.cityList[row]
        }else {
            self.viewModel.selectedTown = self.viewModel.townList[row]
            return self.viewModel.townList[row]
        }
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            self.selectCityLabel.text = "\(self.viewModel.cityList[row])"
        }else {
            self.selectTownLabel.text = "\(self.viewModel.townList[row])"
        }
       
    }
    
}
