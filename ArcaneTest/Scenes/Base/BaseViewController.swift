//
//  BaseViewController.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 23.10.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    func throwAlert(description: String?) {
        let alert = UIAlertController(
            title: AppString.Alert.title,
            message: description,
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(title: AppString.Alert.action, style: .cancel)
        )
        present(alert, animated: true)
    }
}
