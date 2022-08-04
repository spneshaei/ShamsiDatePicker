//
//  PickerExtension.swift
//  
//
//  Created by Farzin Firoozi on 8/4/22.
//

import Foundation
import SwiftUI

extension UIPickerView {
    override open var intrinsicContentSize: CGSize {
        return CGSize(
            width: UIView.noIntrinsicMetric,
            height: super.intrinsicContentSize.height
        )
    }
}
