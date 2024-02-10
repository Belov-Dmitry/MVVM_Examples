//
//  MainCell.swift
//  MVVM_CMDBCMDR
//
//  Created by Dmitry Belov on 31.01.2024.
//

import UIKit


class MainCell: UITableViewCell {
    
    static var identifier: String { "MainCell" }
    private let nameLabel = UILabel()
    private let avatarImageView = UIImageView()
    private var labelStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        avatarImageView.image = UIImage(named: "avatarTMPImage")
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        nameLabel.font = .systemFont(ofSize: 16)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.layer.cornerRadius = 30
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderWidth = 2
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        labelStackView = UIStackView(arrangedSubviews: [avatarImageView, nameLabel])
        labelStackView.axis = .horizontal
        labelStackView.spacing = 10
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(labelStackView)
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    func setupCell(viewModel: MainCellViewModel) {
        nameLabel.text = viewModel.name
        guard let imageUrl = URL(string: viewModel.image) else {return}
        avatarImageView.load(url: imageUrl) //= viewModel.image
    }
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
