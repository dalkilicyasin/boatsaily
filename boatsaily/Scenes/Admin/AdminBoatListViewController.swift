//
//  AdminBoatListViewController.swift
//  boatsaily
//
//  Created by yasin on 25.07.2024.
//

import UIKit
import Foundation
import RealmSwift
import ImageSlideshow

class AdminBoatListViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: AdminBoatListViewModel
    var coordinator: AdminBoatListCoordinator?
    
    public init(viewModel: AdminBoatListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = AdminBoatListViewModel()
       super.init(coder: aDecoder)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Admin Boat List"
        
        //update boat list
        self.viewModel.uploadBoatList()
        
        self.tableView.register(AdminBoatListTableViewCell.nib(), forCellReuseIdentifier: AdminBoatListTableViewCell.idenifier)
    }
}


extension AdminBoatListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.boatInformationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AdminBoatListTableViewCell.idenifier, for: indexPath) as! AdminBoatListTableViewCell
        cell.configure(model: self.viewModel.boatInformationList[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = self.viewModel.boatInformationList[indexPath.row]
           let realm = try! Realm()
            try! realm.write({
                realm.delete(item)
            })
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.coordinator?.navigateTo(to: .detail, with: self.viewModel.boatInformationList[indexPath.row].tourName)
    }
}
