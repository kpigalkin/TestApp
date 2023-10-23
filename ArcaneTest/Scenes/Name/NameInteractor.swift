//
//  NameInteractor.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import Foundation

    // MARK: - Protocols

protocol NameInteractorInput: AnyObject {
    func fetchDetails(for name: String?)
}

protocol NameDataStore {
    var nameDetails: NameData? { get set }
}

    // MARK: - NameInteractor

final class NameInteractor: NameDataStore {
    weak var presenter: NameInteractorOutput?
    
    var nameDetails: NameData?
}

    // MARK: - NameInteractorInput

extension NameInteractor: NameInteractorInput {
    
    @MainActor
    func fetchDetails(for name: String?) {
        Task {
            do {
                guard let name else { throw RequestError.unknown }
                let formarredName = name.replacingOccurrences(of: " ", with: "")
                
                async let ageData = fetch(ArcaneEndpoint.age(name: formarredName))
                async let genderData = fetch(ArcaneEndpoint.gender(name: formarredName))
                async let nationalityData = fetch(ArcaneEndpoint.nationality(name: formarredName))
                
                let details = await (
                    ageData: try decode(AgeModel.self, from: ageData),
                    genderData: try decode(GenderModel.self, from: genderData),
                    nationalityData: try decode(NationalityModel.self, from: nationalityData)
                )
                
                self.nameDetails = NameData(
                    name: name,
                    ageModel: details.ageData,
                    genderModel: details.genderData,
                    nationalityModel: details.nationalityData
                )

                presenter?.detailsLoaded()
                
            } catch let error as RequestError {
                presenter?.handleError(error: error)
            }
        }
    }
}

    // MARK: - HTTPClient & decode

extension NameInteractor: HTTPClient {
    
    func fetch(_ endpoint: Endpoint) async throws -> Data {
        let request = try makeRequest(with: endpoint)
        return try await execute(request: request)
    }
    
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        guard let decodedData = try? JSONDecoder().decode(type.self, from: data) else {
            throw RequestError.decode
        }
        return decodedData
    }
}
