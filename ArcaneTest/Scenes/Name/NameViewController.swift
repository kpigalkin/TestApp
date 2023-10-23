//
//  NameViewController.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import UIKit

    // MARK: - Protocols

protocol NameViewInput: AnyObject {
    func displayAlert(description: String?)
}

    // MARK: - NameViewController

final class NameViewController: BaseViewController {
    
    var presenter: NameViewOutput?
    var router: (NameRouting & NameDataPassing)?
    
    private enum Constants {
        static let textFieldBorderWidth: CGFloat = 1
        static let textFieldHeight: CGFloat = 70
        static let cornerRadius: CGFloat = 10
        static let spacing: CGFloat = 18
        static let widthMultiplier = 0.5
    }
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = AppString.NameScene.placeholder
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.layer.borderWidth = Constants.textFieldBorderWidth
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .systemGray4
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var browseButton: UIButton = {
        let button = UIButton()
        button.setTitle(AppString.NameScene.browse, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = Constants.cornerRadius
        button.addAction(
            UIAction { [weak self] _ in
                guard let self else { return }
                self.browseButtonDidTap()
            },
            for: .touchUpInside
        )
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        configureConstraints()
    }
}

    // MARK: - NameViewInput

extension NameViewController: NameViewInput {
    func displayAlert(description: String?) {
        throwAlert(description: description)
    }
}

    // MARK: - User Interface

private extension NameViewController {
    func browseButtonDidTap() {
        presenter?.didTapBrowse(for: textField.text)
    }
    
    func setupView() {
        view.backgroundColor = .white
    }
    
    func addSubviews() {
        view.addSubview(textField)
        view.addSubview(browseButton)
    }
    
    func configureConstraints() {
        [
            textField,
            browseButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.spacing),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthMultiplier),
            textField.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            browseButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: Constants.spacing),
            browseButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthMultiplier),
            browseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            browseButton.heightAnchor.constraint(equalTo: textField.heightAnchor),
        ])
    }
}
