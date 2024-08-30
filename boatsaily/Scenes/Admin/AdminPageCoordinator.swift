//
//  AdminPageCoordinator.swift
//  boatsaily
//
//  Created by yasin on 24.07.2024.
//

import Foundation
import UIKit

public enum AdminPageRoute {
    case createBoat
    case adminInfo
    case adminBoatList
}

class AdminPageCoordinator: Coordinator {
    
    var childCoordinators: [ any Coordinator] = []
    
    var navigationController: UINavigationController
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = AdminPageViewController.instantiate(name: .main)
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    
    func navigateTo(to route: AdminPageRoute, with data: Any?) {
        switch route {
        case .createBoat:
            let coordinator = CreateBoatCoordinator(navigationController: self.navigationController)
            coordinator.addChildCoordinator(coordinator)
            coordinator.start()
        case .adminInfo:
            
            break
        case .adminBoatList:
            let coordinator = AdminBoatListCoordinator(navigationController: self.navigationController)
            coordinator.addChildCoordinator(coordinator)
            coordinator.start()
        }
    }
}
