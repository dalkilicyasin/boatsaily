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
    
    lazy var networkManager: NetworkManagerTemp = {
        let config = NetworkConfig(baseURL: URL(string: "https://eu-central-1.aws.data.mongodb-api.com")!)
        return NetworkManagerTemp(config: config)
    }()
    
    
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
            if let data = data as? BoatInformationDetailList {
                let detailVC = BoatListCoordinator(navigationController: self.navigationController, boatInformationDetailList: data, networkManager: networkManager )
                detailVC.start()
            }
        }
    }
    
}
