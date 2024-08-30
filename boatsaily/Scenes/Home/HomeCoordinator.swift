//
//  HomeCoordinator.swift
//  boatsaily
//
//  Created by yasin on 19.07.2024.
//

import Foundation
import UIKit

public enum HomeRoute{
    case toDetail
}


class HomeCoordinator: Coordinator {
    typealias T = HomeRoute
    
    var childCoordinators: [ any Coordinator] = []
    
    var navigationController: UINavigationController
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = HomeViewController.instantiate(name: .main)
        controller.coordinator = self
        navigationController.setViewControllers([controller], animated: false)
    }
    
    func navigateTo(to route: HomeRoute, with data: Any?) {
        switch route {
        case .toDetail:
            let detailVC = AdminBoatListCoordinator(navigationController: navigationController)
            detailVC.start()
        }
    }
    
}
