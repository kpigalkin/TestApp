//
//  HTTPClient.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import Foundation

protocol HTTPClient {
    func execute(request: URLRequest) async throws -> Data
}

extension HTTPClient {
    func execute(request: URLRequest) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw RequestError.unknown
        }
        
        switch response.statusCode {
        case 200...299:
            return data
        default:
            throw RequestError.unknown
        }
    }
}
