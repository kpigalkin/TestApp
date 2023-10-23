//
//  DetailPresenter.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import Foundation

    // MARK: - Protocols

protocol DetailViewOutput: AnyObject {
    func didLoad()
}

protocol DetailInteractorOutput: AnyObject {
    func detailsReceived(name: String, age: Int, gender: String, nationality: String)
    func handleError(error: RequestError)
}

    // MARK: - DetailPresenter

final class DetailPresenter {
    
    weak var view: DetailViewInput?
    var router: DetailRouting?
    var interactor: DetailInteractorInput?
}

    // MARK: - DetailViewOutput

extension DetailPresenter: DetailViewOutput {
    func didLoad() {
        interactor?.getDetails()
    }
}

    // MARK: - DetailInteractorOutput

extension DetailPresenter: DetailInteractorOutput {
    func handleError(error: RequestError) {
        view?.displayAlert(description: error.description)
    }
    
    func detailsReceived(name: String, age: Int, gender: String, nationality: String) {
        view?.display(.init(
            name: name,
            age: AppString.DetailScene.age + String(age),
            gender: AppString.DetailScene.gender + gender,
            nationality: AppString.DetailScene.nationality + nationality
        ))
    }
}
