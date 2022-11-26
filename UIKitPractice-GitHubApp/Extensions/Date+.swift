//
//  Date+.swift
//  UIKitPractice-GitHubApp
//
//  Created by Kim Insub on 2022/11/26.
//

import Foundation

extension Date {

    func convertToMonthYearFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: self)
    }
}
