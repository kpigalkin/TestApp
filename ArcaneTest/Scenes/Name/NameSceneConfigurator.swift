//
//  NameConfigurator.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import Foundation
 
final class NameSceneConfigurator {
    
    static func configure() -> NameViewController {
        let viewController = NameViewController()
        let interactor = NameInteractor()
        let presenter = NamePresenter()
        let router = NameRouter()
        
        viewController.presenter = presenter
        viewController.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = viewController
        router.dataStore = interactor
        interactor.presenter = presenter
        
        return viewController
    }
}
