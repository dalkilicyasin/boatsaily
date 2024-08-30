//
//  BoatListViewController.swift
//  boatsaily
//
//  Created by yasin on 19.07.2024.
//

import UIKit

class BoatListViewController: UIViewController, Storyboarded {
    
    var coordinator: BoatListCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Detail"
        
    }

}
