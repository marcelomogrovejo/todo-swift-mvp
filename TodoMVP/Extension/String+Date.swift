//
//  String+Date.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import Foundation

extension String {

    var formattedDate: Date {
        getFormattedDate()
    }

    var isoFormattedDate: Date {
        getISOFormattedDate()
    }

    private func getFormattedDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        let formattedDate = dateFormatter.date(from: self) ?? Date.now
        return formattedDate
    }

    private func getISOFormattedDate() -> Date {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions.insert(.withFractionalSeconds)
        let isoFormattedDate = dateFormatter.date(from: self) ?? Date.now
        return isoFormattedDate
    }

}
