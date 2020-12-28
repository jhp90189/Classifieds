//
//  ClasifiedsServices.swift
//  ClasifiedsServices
//
//  Copyright © 2020 Jainesh Patel. All rights reserved.
//

import Foundation

// conf1·gure endpoint to make service calls
class ClassifiedsServices {
    
    private let apiClient = APIClient()
    private let baseURL = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/"
    private var getClassifiedsListURL : String {
        return baseURL + "default/dynamodb-writer"
    }
    private let shouldUseStubData = true
    
    //API call to fetch list of employees
    func fetchClassifiedsList(mockFileName: String? = nil, completion: @escaping ((Result<ClassifiedsListResponse>) -> Void)) {
        if let mockFile = mockFileName {
            fetchClassifiedsUsingMock(completion: completion, mockFileName: mockFile)
        } else {
            guard let classifiedURL = URL(string: getClassifiedsListURL) else { return }
            let resourse = Resource(url: classifiedURL)
            apiClient.load(resourse) { result in
                switch result {
                case . success(let data):
                    do {
                        let items = try JSONDecoder().decode(ClassifiedsListResponse.self, from: data)
                        completion(.success(items))
                        
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    private func fetchClassifiedsUsingMock(completion: @escaping ((Result<ClassifiedsListResponse>) -> Void), mockFileName: String) {
        do {
            if let filePath = Bundle.main.path(forResource: mockFileName, ofType: "json") {
                let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
                let items = try JSONDecoder().decode(ClassifiedsListResponse.self, from: data)
                completion(.success(items))
            }
        } catch {
            completion(.failure(error))
        }
    }
}
