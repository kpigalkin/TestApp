//
//  DetailInteractor.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import Foundation

    // MARK: - Protocols

protocol DetailInteractorInput: AnyObject {
    func getDetails()
}

protocol DetailDataStore {
    var nameDetails: NameData? { get set }
}

    // MARK: - DetailInteractor

final class DetailInteractor: DetailDataStore {
    weak var presenter: DetailInteractorOutput?
    var nameDetails: NameData?
}

extension DetailInteractor: DetailInteractorInput {
    func getDetails() {
        let countryName = nameDetails?.nationalityModel.country
            .sorted {
                $0.probability < $1.probability
            }
            .first
        
        guard
            let nameDetails,
            let countryName
        else {
            presenter?.handleError(error: .unknown)
            return
        }
        
        presenter?.detailsReceived(
            name: nameDetails.name,
            age: nameDetails.ageModel.age,
            gender: nameDetails.genderModel.gender,
            nationality: countryName.name
        )
    }
}
