//
//  ViewController.swift
//  MVVM_CMDBCMDR
//
//  Created by Dmitry Belov on 29.01.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel = MainViewModel()
    var cellDataSource = [MainCellViewModel]()
    
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getUsers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setConstraints()
        bindViewModel()
    }
    
    private func setupViews () {
        view.backgroundColor = .white
        title = "Main"
        
        view.addSubview(tableView)
        setupTableView()
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
    }

    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading else { return }
            DispatchQueue.main.async {
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            }
        }
        
        viewModel.cellDataSourse.bind { [weak self] users in
            guard let self, let users else { return }
            cellDataSource = users
            reloadTableView()
        }
    }
    
    func presentDetailsViewController(user: Character) {
        let detailViewModel = DetailsViewModel(user: user)
        let detailViewController = DetailsViewController(detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

extension MainViewController {
    private func setConstraints () {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
