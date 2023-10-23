//
//  AgifyEndpoint.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import Foundation

enum ArcaneEndpoint {
    case age(name: String)
    case gender(name: String)
    case nationality(name: String)
}

extension ArcaneEndpoint: Endpoint {
    var host: String {
        switch self {
        case .age(name: _):
            return "api.agify.io"
        case .gender(name: _):
            return "api.genderize.io"
        case .nationality(name: _):
            return "api.nationalize.io"
        }
    }
    
    var path: String {
        switch self {
        default:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .age(name: let name):
            return [ URLQueryItem(name: "name", value: name) ]
        case .gender(name: let name):
            return [ URLQueryItem(name: "name", value: name) ]
        case .nationality(name: let name):
            return [ URLQueryItem(name: "name", value: name) ]
        }
    }
}
