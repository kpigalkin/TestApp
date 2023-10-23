//
//  DetailRouter.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import UIKit

// MARK: - Protocols

protocol DetailRouting {}

protocol DetailDataPassing {
    var dataStore: DetailDataStore? { get }
}

    // MARK: - DetailRouter

final class DetailRouter: DetailDataPassing {
    weak var viewController: UIViewController?
    var dataStore: DetailDataStore?
}

    // MARK: - DetailRouting

extension DetailRouter: DetailRouting {}
