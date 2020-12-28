//
//  CommonUtilityTests.swift
//  ClassifiedsTests
//
//  Created by Apple on 28/12/20.
//  Copyright © 2020 Jainesh Patel. All rights reserved.
//

import XCTest
@testable import Classifieds

class CommonUtilityTests: XCTestCase {
    
    func testDateFormater() {
        let dateString = "2019-01-04 04:04:17.566515"
        let date = dateString.convertToDate()
        XCTAssertTrue(date == "04 January 2019, 04:04 am")
    }
    
    func testImageLoading() {
        let imageView = UIImageView()
        imageView.loadImage(urlString: "")
        XCTAssertTrue(imageView.image == UIImage(named: "placeholder"))
    }
}
