//
//  Month.swift
//  ShamsiAppTest
//
//  Created by Seyyed Parsa Neshaei on 8/28/21.
//

import Foundation

internal struct Month: Identifiable, Hashable {
    var id: Int
    var persianName: String
    var numberOfDays: Int
    var isApplicableForLeapYearIncrease: Bool = false
    
    init(id: Int, persianName: String, numberOfDays: Int, isApplicableForLeapYearIncrease: Bool = false) {
        self.id = id
        self.persianName = persianName
        self.numberOfDays = numberOfDays
        self.isApplicableForLeapYearIncrease = isApplicableForLeapYearIncrease
    }
    
    func numberOfDays(in year: Int) -> Int {
        guard isApplicableForLeapYearIncrease else { return numberOfDays }
        var components = DateComponents()
        components.year = year
        components.month = id
        components.day = numberOfDays + 1
        return components.isValidDate(in: Calendar(identifier: .persian)) ? numberOfDays + 1 : numberOfDays
    }
}
