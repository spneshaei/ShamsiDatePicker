//
//  DateExtension.swift
//  ShamsiAppTest
//
//  Created by Seyyed Parsa Neshaei on 8/28/21.
//

import Foundation

internal extension Date {
    var stringValue: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "fa_IR")
        let result = dateFormatter.string(from: self)
        #if os(watchOS)
        return String(result.first ?? Character(""))
        #else
        return result
        #endif
    }
    
    var longerStringValue: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "fa_IR")
        return dateFormatter.string(from: self)
    }
}
