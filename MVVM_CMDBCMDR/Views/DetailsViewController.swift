//
//  DetailsViewController.swift
//  MVVM_CMDBCMDR
//
//  Created by Dmitry Belov on 31.01.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let avatarImageView = UIImageView()
    private let idLabel = UILabel()
    private let nameLabel = UILabel()
    private let typeLabel = UILabel()
    private let locationNameLabel = UILabel()
    private let createdLabel = UILabel()
    private let episodeTextView = UITextView()
//    private let cityLabel = UILabel()
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
        displayUserInfo()
    }
    
    private func setupViews() {
        title = detailsViewModel.name
        view.backgroundColor = .white
        labelStackView = UIStackView(arrangedSubviews: [avatarImageView, idLabel, nameLabel, typeLabel, locationNameLabel, createdLabel, episodeTextView])
        labelStackView.axis = .vertical
        labelStackView.spacing = 2
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelStackView)
        avatarImageView.image = UIImage(named: "avatarTMPImage")
        episodeTextView.font = .systemFont(ofSize: 16)
        episodeTextView.isEditable = false
    }
    
    private func displayUserInfo() {
        guard let imageUrl = URL(string: detailsViewModel.image) else {return}
        avatarImageView.load(url: imageUrl)
        idLabel.text = "id: " + String(detailsViewModel.id)
        nameLabel.text = "Name: " + detailsViewModel.name
        typeLabel.text = "Type: " + detailsViewModel.type
        locationNameLabel.text = "Location: " + detailsViewModel.locationName
        createdLabel.text = "Created: " + detailsViewModel.created
        let tmpEpisodeArray = ["Episodes:"] + detailsViewModel.episode
        episodeTextView.text = tmpEpisodeArray.joined(separator: "\n")
//        suiteLabel.text = detailsViewModel.suite
//        cityLabel.text = detailsViewModel.city
        
    }
    
}
//MARK: - Set Constraints

extension DetailsViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            episodeTextView.widthAnchor.constraint(equalTo: labelStackView.widthAnchor),
            episodeTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
