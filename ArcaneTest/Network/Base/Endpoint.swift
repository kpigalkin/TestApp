//
//  Endpoint.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [URLQueryItem] { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
}
