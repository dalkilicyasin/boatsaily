//
//  ProifleViewController.swift
//  boatsaily
//
//  Created by yasin on 19.07.2024.
//

import UIKit

class ProifleViewController: UIViewController, Storyboarded {

    var coordinator: ProfileCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Profile"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.lightGray
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueWithoutLoginButtonTapped(_ sender: Any) {
        self.coordinator?.navigateTo(to: .toAdminPage, with: nil)
    }
    
}
