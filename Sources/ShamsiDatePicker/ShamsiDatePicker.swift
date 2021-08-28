//
//  ShamsiDatePicker.swift
//  ShamsiAppTest
//
//  Created by Seyyed Parsa Neshaei on 8/27/21.
//

import SwiftUI

public struct ShamsiDatePicker: View {
    
    // MARK: Constants
    
    let persianCalendar = Calendar(identifier: .persian)
    
    let months: [Month] = [
        Month(id: 1, persianName: "فروردین", numberOfDays: 31),
        Month(id: 2, persianName: "اردیبهشت", numberOfDays: 31),
        Month(id: 3, persianName: "خرداد", numberOfDays: 31),
        Month(id: 4, persianName: "تیر", numberOfDays: 31),
        Month(id: 5, persianName: "مرداد", numberOfDays: 31),
        Month(id: 6, persianName: "شهریور", numberOfDays: 31),
        Month(id: 7, persianName: "مهر", numberOfDays: 30),
        Month(id: 8, persianName: "آبان", numberOfDays: 30),
        Month(id: 9, persianName: "آذر", numberOfDays: 30),
        Month(id: 10, persianName: "دی", numberOfDays: 30),
        Month(id: 11, persianName: "بهمن", numberOfDays: 30),
        Month(id: 12, persianName: "اسفند", numberOfDays: 29, isApplicableForLeapYearIncrease: true)
    ]
    
    #if os(iOS)
    let minHeight: CGFloat = 200
    #else
    let minHeight: CGFloat = 0
    #endif
    
    #if os(watchOS)
    let dayScale: CGFloat = 0.3
    let monthScale: CGFloat = 0.37
    let yearScale: CGFloat = 0.33
    #else
    let dayScale: CGFloat = 0.4
    let monthScale: CGFloat = 0.3
    let yearScale: CGFloat = 0.3
    #endif
    
    // MARK: Value Properties
    
    var minDate = Date(timeIntervalSince1970: -2500000000)
    var maxDate: Date? = nil
    
    // MARK: Bindings
    
    @Binding var selectedDate: Date {
        didSet {
            if selectedDate < minDate {
                withAnimation { selectedDate = minDate }
            } else if let maxDate = maxDate, selectedDate > maxDate {
                withAnimation { selectedDate = maxDate }
            }
        }
    }
    
    // MARK: Initializer
    
    public init(selectedDate: Binding<Date>, minDate: Date = Date(timeIntervalSince1970: -2500000000), maxDate: Date? = nil) {
        self._selectedDate = selectedDate
        self.minDate = minDate
        self.maxDate = maxDate
    }
    
    // MARK: SwiftUI Helper Properties
    
    var daySelectionBinding: Binding<Int> {
        Binding(get: { persianCalendar.component(.day, from: selectedDate) },
            set: {selectedDate = date(bySetting: .day, value: $0, of: selectedDate)})
    }
    
    var monthSelectionBinding: Binding<Int> {
        Binding(get: { persianCalendar.component(.month, from: selectedDate) },
            set: {selectedDate = date(bySetting: .month, value: $0, of: selectedDate)})
    }
    
    var yearSelectionBinding: Binding<Int> {
        Binding(get: { persianCalendar.component(.year, from: selectedDate) },
            set: {selectedDate = date(bySetting: .year, value: $0, of: selectedDate)})
    }
    
    // MARK: Data Helper Properties

    var minYear: Int {
        let year = persianCalendar.component(.year, from: minDate)
        return (year == 1) ? year : year - 1
    }
    
    var maxYear: Int {
        guard let maxDate = maxDate else { return 2000 }
        let year = persianCalendar.component(.year, from: maxDate)
        return (year == Int.max) ? year : year + 1
    }
    
    // MARK: SwiftUI Helper Functions
    
    func dayPicker(daySelection: Binding<Int>, monthSelectionID: Binding<Int>, geometry: GeometryProxy) -> some View {
        Picker("روز", selection: daySelection) {
            ForEach(1...getMonth(id: monthSelectionID.wrappedValue).numberOfDays(in: yearSelectionBinding.wrappedValue), id: \.self) { day in
                Text("\(day.persian) \(date(bySetting: .day, value: day, of: selectedDate).stringValue ?? "")")
                    .id(day)
            }
        }
        .frame(maxWidth: geometry.size.width * dayScale)
        .shamsiStyle()
    }
    
    func monthPicker(monthSelectionID: Binding<Int>, geometry: GeometryProxy) -> some View {
        Picker("ماه", selection: monthSelectionID) {
            ForEach(1 ... 12, id: \.self) { id in
                Text(getMonth(id: id).persianName)
            }
        }
        .frame(maxWidth: geometry.size.width * monthScale)
        .shamsiStyle()
    }
    
    func yearPicker(yearSelection: Binding<Int>, geometry: GeometryProxy) -> some View {
        Picker("سال", selection: yearSelection) {
            ForEach(minYear...maxYear, id: \.self) { year in
                Text(year.persian)
            }
        }
        .frame(maxWidth: geometry.size.width * yearScale)
        .shamsiStyle()
    }
    
    // MARK: Data Helper Functions
    
    func getMonth(id: Int) -> Month {
        months[id - 1]
    }
    
    func date(bySetting setting: Calendar.Component, value: Int, of originalDate: Date) -> Date {
        var components = persianCalendar.dateComponents([.year, .month, .day], from: originalDate)
        switch setting {
        case .day:
            components.day = value
        case .month:
            components.month = value
        case .year:
            components.year = value
        default:
            break
        }
        return persianCalendar.date(from: components) ?? originalDate
    }
    
    // MARK: SwiftUI View Body
    
    public var body: some View {
        let daySelection = daySelectionBinding
        let monthSelectionID = monthSelectionBinding
        let yearSelection = yearSelectionBinding
        
        return GeometryReader { geometry in
                HStack(spacing: 0) {
                    dayPicker(daySelection: daySelection, monthSelectionID: monthSelectionID, geometry: geometry)
                    monthPicker(monthSelectionID: monthSelectionBinding, geometry: geometry)
                    yearPicker(yearSelection: yearSelection, geometry: geometry)
                }
            }
            .font(.footnote)
            .frame(minHeight: minHeight)
            .environment(\.layoutDirection, .rightToLeft)
    }
}

struct ShamsiDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ShamsiDatePicker(selectedDate: .constant(Date()))
    }
}
