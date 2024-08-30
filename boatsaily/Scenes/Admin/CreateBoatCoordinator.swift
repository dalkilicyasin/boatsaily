//
//  CreateBoatCoordinator.swift
//  boatsaily
//
//  Created by yasin on 25.07.2024.
//

import Foundation
import UIKit

public enum CreateBoatRoute{
    
}

class CreateBoatCoordinator: Coordinator {
    typealias T = CreateBoatRoute
    
    var childCoordinators: [ any Coordinator] = []
    
    var navigationController: UINavigationController
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = CreateBoatViewController.instantiate(name: .main)
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func navigateTo(to route: CreateBoatRoute, with data: Any?) {
        //
    }
}
