//
//  TabBarViewController.swift
//  boatsaily
//
//  Created by yasin on 18.07.2024.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
    let profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()

        homeCoordinator.start()
        profileCoordinator.start()
        
        viewControllers = [homeCoordinator.navigationController, profileCoordinator.navigationController]
    }
}
