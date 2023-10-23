//
//  DetailViewController.swift
//  ArcaneTest
//
//  Created by Кирилл Пигалкин on 22.10.2023.
//

import UIKit

    // MARK: - Protocols

protocol DetailViewInput: AnyObject {
    func display(_ viewModel: DetailViewModel)
    func displayAlert(description: String?)
}

    // MARK: - DetailViewController

final class DetailViewController: BaseViewController {
    
    var presenter: DetailViewOutput?
    var router: (DetailRouting & DetailDataPassing)?
    
    private enum Constants {
        static let spacing: CGFloat = 20
    }
    
    private lazy var ageTitle: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var genderTitle: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nationalityTitle: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        configureConstraints()
        presenter?.didLoad()
    }
}

    // MARK: - DetailViewInput

extension DetailViewController: DetailViewInput {
    func displayAlert(description: String?) {
        throwAlert(description: description)
    }
    
    func display(_ details: DetailViewModel) {
        navigationItem.title = details.name
        ageTitle.text = details.age
        genderTitle.text = details.gender
        nationalityTitle.text = details.nationality
    }
}

    // MARK: - User Interface

private extension DetailViewController {
    
    func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
    }
    
    func addSubviews() {
        view.addSubview(ageTitle)
        view.addSubview(genderTitle)
        view.addSubview(nationalityTitle)
    }
    
    func configureConstraints() {
        [
            ageTitle,
            genderTitle,
            nationalityTitle
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            ageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.spacing),
            ageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageTitle.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            genderTitle.topAnchor.constraint(equalTo: ageTitle.bottomAnchor, constant: Constants.spacing),
            genderTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderTitle.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            nationalityTitle.topAnchor.constraint(equalTo: genderTitle.bottomAnchor, constant: Constants.spacing),
            nationalityTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nationalityTitle.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}
