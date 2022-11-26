//
//  String+.swift
//  UIKitPractice-GitHubApp
//
//  Created by Kim Insub on 2022/11/26.
//

import Foundation

extension String {

    func convertToDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = .current
        return formatter.date(from: self)
    }

    func converToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A"}
        return date.convertToMonthYearFormat()
    }
}
