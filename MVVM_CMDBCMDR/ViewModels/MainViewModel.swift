//
//  MainViewModel.swift
//  MVVM_CMDBCMDR
//
//  Created by Dmitry Belov on 29.01.2024.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSourse: Observable<[MainCellViewModel]> = Observable(nil)
    var dataSource: [Character]?
    
    
    func numberOfSection() -> Int {
        return 1 //return можно опустить
    }
    
    func numberOfRows(_ section: Int)-> Int {
        return dataSource?.count ?? 0
    }
    
    func getUsers() {
        isLoading.value = true
        
        NetworkDataFetch.shared.fetchUsers { [weak self] users, error in
            guard let self else { return }
            self.isLoading.value = false
            if let users {
                self.dataSource = users
                mapCellData()
            }
        }
    }
    
    func mapCellData() {
        cellDataSourse.value = dataSource?.compactMap({ MainCellViewModel($0) })
    }
}
