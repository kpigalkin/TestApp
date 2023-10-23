//
//  NationalizeModel.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import Foundation

struct NationalityModel: Decodable {
    let count: Int
    let name: String
    let country: [Country]
}

struct Country: Decodable {
    let name: String
    let probability: Double

    enum CodingKeys: String, CodingKey {
        case name = "country_id"
        case probability
    }
}
