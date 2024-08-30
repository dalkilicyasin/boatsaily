//
//  BoatListCoordinator.swift
//  boatsaily
//
//  Created by yasin on 19.07.2024.
//

import Foundation
import UIKit

enum BaseRoute {
    
}

class BoatListCoordinator: Coordinator {
    typealias T = BaseRoute
    
    var childCoordinators: [ any Coordinator] = []
    
    var navigationController: UINavigationController
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = BoatListViewController.instantiate(name: .main)
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func navigateTo(to route: BaseRoute, with data: Any?) {
        //
    }
    
    
}
