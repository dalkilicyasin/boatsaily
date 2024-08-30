//
//  AdminPageViewController.swift
//  boatsaily
//
//  Created by yasin on 24.07.2024.
//

import UIKit


class AdminPageViewController: UIViewController, Storyboarded {

    var coordinator: AdminPageCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Admin Page"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedCreatePage(_ sender: Any) {
        self.coordinator?.navigateTo(to: .createBoat, with: nil)
        
    }
    
    @IBAction func tappedAdminBoatListPage(_ sender: Any) {
        self.coordinator?.navigateTo(to: .adminBoatList, with: nil)
    }
    
}
