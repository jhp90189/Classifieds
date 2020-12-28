//
//  ClassifiedsListViewModel.swift
//  Classifieds
//
//  Created by Apple on 28/12/20.
//  Copyright © 2020 Jainesh Patel. All rights reserved.
//

import Foundation

class ClassifiedsListViewModel: NSObject {
    private let apiService = ClassifiedsServices()
    
    private(set) var classifiedList: [Classified] = [] {
        didSet {
            self.bindClassifiedList(classifiedList)
        }
    }
    
    var bindClassifiedList: (([Classified]) -> ()) = { _ in }
    
    override init() {
        super.init()
    }
    
    func callApiToFetchCurrencyList() {
        if classifiedList.count > 0 {
            bindClassifiedList(classifiedList)
        } else {
            apiService.fetchClassifiedsList { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let response):
                        self?.classifiedList = response.results
                    case .failure(_):
                        break
                    }
                }
            }
        }
    }
}
