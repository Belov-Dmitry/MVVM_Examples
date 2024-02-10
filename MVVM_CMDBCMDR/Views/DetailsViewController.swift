//
//  DetailsViewController.swift
//  MVVM_CMDBCMDR
//
//  Created by Dmitry Belov on 31.01.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    private let streetLabel = UILabel()
    private let suiteLabel = UILabel()
    private let cityLabel = UILabel()
    private var labelStackView = UIStackView()

    
    let detailsViewModel: DetailsViewModel
    
    init(_ detailsViewModel: DetailsViewModel) {
        self.detailsViewModel = detailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        //displayUserInfo()
    }
    
    private func setupViews() {
        title = "User Detail"
        view.backgroundColor = .white
        labelStackView = UIStackView(arrangedSubviews: [nameLabel, usernameLabel, emailLabel, phoneLabel, streetLabel, suiteLabel, cityLabel])
        labelStackView.axis = .vertical
        labelStackView.spacing = 2
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelStackView)
    }
    
//    private func displayUserInfo() {
//        nameLabel.text = detailsViewModel.name
//        usernameLabel.text = detailsViewModel.username
//        emailLabel.text = detailsViewModel.email
//        phoneLabel.text = detailsViewModel.phone
//        streetLabel.text = detailsViewModel.street
//        suiteLabel.text = detailsViewModel.suite
//        cityLabel.text = detailsViewModel.city
//        
//    }
    
}
//MARK: - Set Constraints

extension DetailsViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
