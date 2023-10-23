//
//  NamePresenter.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import Foundation

    // MARK: - Protocols

protocol NameViewOutput: AnyObject {
    func didTapBrowse(for name: String?)
}

protocol NameInteractorOutput: AnyObject {
    func detailsLoaded()
    func handleError(error: RequestError)
}

    // MARK: - NamePresenter

final class NamePresenter {
    
    weak var view: NameViewInput?
    var router: NameRouting?
    var interactor: NameInteractorInput?
}

    // MARK: - NameViewOutput

extension NamePresenter: NameViewOutput {
    func didTapBrowse(for name: String?) {
        interactor?.fetchDetails(for: name)
    }
}

    // MARK: - NameInteractorOutput

extension NamePresenter: NameInteractorOutput {
    func handleError(error: RequestError) {
        view?.displayAlert(description: error.description)
    }
    
    func detailsLoaded() {
        router?.routeToDetailScene()
    }
}
