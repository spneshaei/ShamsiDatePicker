//
//  ShamsiDatePickerViewModifier.swift
//  ShamsiAppTest
//
//  Created by Seyyed Parsa Neshaei on 8/28/21.
//

import SwiftUI

struct ShamsiDatePickerViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipped()
            .pickerStyle(WheelPickerStyle())
    }
}

extension View {
    func shamsiStyle() -> some View {
        self.modifier(ShamsiDatePickerViewModifier())
    }
}
