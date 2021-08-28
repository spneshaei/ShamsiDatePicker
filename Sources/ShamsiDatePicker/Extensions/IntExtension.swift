//
//  IntExtension.swift
//  ShamsiAppTest
//
//  Created by Seyyed Parsa Neshaei on 8/28/21.
//

import Foundation

internal extension Int {
    var persian: String {
        let format = NumberFormatter()
        format.locale = Locale(identifier: "fa_IR")
        let number = format.number(from: String(self)) ?? NSNumber(value: self)
        return format.string(from: number) ?? String(self)
    }
}
