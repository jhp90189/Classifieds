//
//  String+DateFormatter.swift
//  Classifieds
//
//  Created by Apple on 28/12/20.
//  Copyright © 2020 Jainesh Patel. All rights reserved.
//

import Foundation

extension String {
    func convertToDate() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let convertedDate = dateFormater.date(from: self) ?? Date()
        dateFormater.dateFormat = "d MMM y, HH:mm"
        return dateFormater.string(from: convertedDate)
    }
}
