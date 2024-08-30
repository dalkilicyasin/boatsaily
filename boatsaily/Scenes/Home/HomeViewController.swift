//
//  HomeViewController.swift
//  boatsaily
//
//  Created by yasin on 19.07.2024.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {

    var coordinator: HomeCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Home"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toBoatList(_ sender: Any) {
        coordinator?.navigateTo(to: .toDetail, with: nil)
    }
    
}
