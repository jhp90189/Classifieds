//
//  ClassifiedsTests.swift
//  ClassifiedsTests
//
//  Created by Apple on 28/12/20.
//  Copyright © 2020 Jainesh Patel. All rights reserved.
//

import XCTest
@testable import Classifieds

class ClassifiedsTests: XCTestCase {

   let classifiedsService = ClassifiedsServices()
    
    func testSuccessOfFetchClassifiedListService() {
        classifiedsService.fetchClassifiedsList(mockFileName: "classifieds") {  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    XCTAssertNotNil(response)
                case .failure(_):
                    XCTFail("fetch classified list service is failing")
                }
            }
        }
    }

    func testFailureOfFetchClassifiedListService() {
        classifiedsService.fetchClassifiedsList(mockFileName: "classifieds_invalid") {  result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    XCTFail("fetch classified list service should fail on invalid response")
                case .failure(let error):
                    XCTAssertNotNil(error)
                }
            }
        }
    }

}
