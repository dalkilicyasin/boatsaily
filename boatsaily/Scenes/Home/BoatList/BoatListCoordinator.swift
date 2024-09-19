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
    
    private lazy var boatlistRepository: BoatListRepository = {
        return BoatListNetworkService(networkManager: self.networkManager)
    }()
    
    private lazy var boatListViewModel: BoatListViewModel = {
        return BoatListViewModel(boatListRepository: boatlistRepository)
    }()
    
    var childCoordinators: [ any Coordinator] = []
    
    var navigationController: UINavigationController
    var boatInformationDetailList: BoatInformationDetailList
    var networkManager: NetworkManagerTemp
   
    init(navigationController: UINavigationController, boatInformationDetailList: BoatInformationDetailList, networkManager: NetworkManagerTemp) {
        self.navigationController = navigationController
        self.boatInformationDetailList = boatInformationDetailList
        self.networkManager = networkManager
    }
    
    func start() {
        let controller = BoatListViewController.instantiate(name: .main)
        controller.viewModel = boatListViewModel
        controller.viewModel.boatListDetailModel = boatInformationDetailList
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func navigateTo(to route: BaseRoute, with data: Any?) {
        //
    }
    
    
}
