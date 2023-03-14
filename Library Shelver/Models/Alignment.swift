//
//  Alignment.swift
//  Library Shelver
//
//  Created by Alistair White on 3/13/23.
//

import Foundation
import SwiftUI

struct CustomCenter: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context[HorizontalAlignment.center]
    }
}
extension HorizontalAlignment {
    static let customCenter: HorizontalAlignment = .init(CustomCenter.self)
}
