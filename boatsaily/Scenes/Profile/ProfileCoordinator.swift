//
//  ProfileCoordinator.swift
//  boatsaily
//
//  Created by yasin on 19.07.2024.
//

import Foundation
import UIKit

public enum ProfileRoute {
    case toAdminPage
}

class ProfileCoordinator: Coordinator {
    typealias T = ProfileRoute
    
    var childCoordinators: [ any Coordinator] = []
    
    var navigationController: UINavigationController
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ProifleViewController.instantiate(name: .main)
        controller.coordinator = self
        navigationController.setViewControllers([controller], animated: false)
    }
    
    func navigateTo(to route: ProfileRoute, with data: Any?) {
        switch route {
        case .toAdminPage :
            let adminPageCoordinator = AdminPageCoordinator(navigationController: self.navigationController)
            self.addChildCoordinator(adminPageCoordinator)
            adminPageCoordinator.start()
        }
    }
}
