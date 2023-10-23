//
//  NameRouter.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import UIKit

    // MARK: - Protocols

protocol NameRouting {
    func routeToDetailScene()
}

protocol NameDataPassing {
    var dataStore: NameDataStore? { get }
}

    // MARK: - NameRouter

final class NameRouter: NameDataPassing {
    weak var viewController: UIViewController?
    var dataStore: NameDataStore?
}

    // MARK: - NameRouting

extension NameRouter: NameRouting {
    func routeToDetailScene() {
        let destinationViewController = DetailSceneConfigurator.configure()
        var destinationDataStore = destinationViewController.router?.dataStore
        
        destinationDataStore?.nameDetails = dataStore?.nameDetails
        viewController?.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
