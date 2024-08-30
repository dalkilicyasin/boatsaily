//
//  AdminInfoCoordinator.swift
//  boatsaily
//
//  Created by yasin on 25.07.2024.
//

import Foundation
import UIKit

public enum AdminInfoRoute {
}

class AdminInfoCoordinator: Coordinator {
    typealias Route = AdminInfoRoute
    var childCoordinators: [ any Coordinator] = []
    
    var navigationController: UINavigationController
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
      
    }
    
    func navigateTo(to route: Route, with data: Any?) {
        //
    }
}

