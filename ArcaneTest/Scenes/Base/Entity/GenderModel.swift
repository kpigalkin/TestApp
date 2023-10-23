//
//  GenderModel.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import Foundation

struct GenderModel: Decodable {
    let count: Int
    let name: String
    let gender: String
    let probability: Double
}
