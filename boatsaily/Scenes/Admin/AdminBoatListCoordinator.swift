//
//  AdminBoatListCoordinator.swift
//  boatsaily
//
//  Created by yasin on 25.07.2024.
//

import Foundation
import UIKit

public enum BoatListRoute {
    case detail
}

class AdminBoatListCoordinator: Coordinator {

    var childCoordinators: [ any Coordinator] = []
    
    var navigationController: UINavigationController
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = AdminBoatListViewController.instantiate(name: .main)
        controller.coordinator = self
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    
    func navigateTo(to route: BoatListRoute, with data: Any?) {
        switch route {
        case .detail :
            let coordinator = AdminBoatListDetailCoordinator(navigationController: self.navigationController)
            if let data = data as? String {
                coordinator.tourName = data
            }
            coordinator.addChildCoordinator(coordinator)
            coordinator.start()
        }
    }
}

