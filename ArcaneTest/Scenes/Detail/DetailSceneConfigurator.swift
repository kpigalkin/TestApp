//
//  DetailSceneConfigurator.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import Foundation

final class DetailSceneConfigurator {
    
    static func configure() -> DetailViewController {
        let viewController = DetailViewController()
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        
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
