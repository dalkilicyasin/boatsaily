//
//  Coordinator.swift
//  boatsaily
//
//  Created by yasin on 18.07.2024.
//
import Foundation
import UIKit


public protocol Coordinator: AnyObject {
    associatedtype T
    var childCoordinators: [any Coordinator] {get set}
    func start()
    func navigateTo(to route: T, with data: Any?)
}

public extension Coordinator {
    func finish(){}
    
    func addChildCoordinator(_ coordinator:  any Coordinator) {
        self.childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator:  any Coordinator) {
        guard let index = childCoordinators.firstIndex(
            where: { $0 === coordinator }) else {
            print("Child coordinator not found")
            return
        }
    }
    
    func removeAllChildCoordinators(){}
}
