//
//  AdminBoatListDetailCoordinator.swift
//  boatsaily
//
//  Created by yasin on 17.08.2024.
//

import Foundation
import UIKit

public enum BoatListDetailRoute {
    
}

class AdminBoatListDetailCoordinator: Coordinator {
    typealias T = BoatListDetailRoute
    
    var childCoordinators: [ any Coordinator] = []
    
    var navigationController: UINavigationController
    
    var tourName: String = ""
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = AdminBoatListDetailViewController.instantiate(name: .main)
        controller.viewModel.tourName = self.tourName 
        controller.coordinator = self
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func navigateTo(to route: BoatListDetailRoute, with data: Any?) {
        //
    }
}
