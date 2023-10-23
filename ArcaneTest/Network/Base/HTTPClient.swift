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
    
    func makeRequest(with endpoint: Endpoint) throws -> URLRequest {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.parameters

        guard let url = components.url else {
            throw RequestError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.name
        
        return request
    }
}
