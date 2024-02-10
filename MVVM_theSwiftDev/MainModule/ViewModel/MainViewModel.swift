//
//  MainViewModel.swift
//  MVVM_theSwiftDev
//
//  Created by Dmitry Belov on 24.01.2024.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData)->())? { get set }
    func startFetch()
    func error()
}

final class MainViewModel: MainViewModelProtocol {
    func error() {
        updateViewData?(.failure(ViewData.Data(icon: "failure",
                                                                 title: "Error",
                                                                 description: "Not User",
                                                                 numberPhone: nil)))
    }
    
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func startFetch() {
        //start loading
        updateViewData?(.success(ViewData.Data(icon: "success",
                                                                 title: "success",
                                                                 description: "Good",
                                                                 numberPhone: nil)))
//        updateViewData?(.loading(ViewData.Data(icon: nil,
//                                              title: nil,
//                                              description: nil,
//                                              numberPhone: nil)))
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
//            self?.updateViewData?(.success(ViewData.Data(icon: "success",
//                                                         title: "success",
//                                                         description: "Good",
//                                                         numberPhone: nil)))
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
//            self?.updateViewData?(.failure(ViewData.Data(icon: "failure",
//                                                         title: "Error",
//                                                         description: "Not User",
//                                                         numberPhone: nil)))
//        }
    }
}
