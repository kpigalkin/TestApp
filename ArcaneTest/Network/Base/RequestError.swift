//
//  RequestError.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import Foundation

enum RequestError: Error {
    case unknown
    case invalidURL
    case decode
}

extension RequestError {
    var description: String {
        switch self {
        case .unknown:
            return "Try again"
        case .invalidURL:
            return "Invalid URL"
        case .decode:
            return "Decode data error"
        }
    }
}
