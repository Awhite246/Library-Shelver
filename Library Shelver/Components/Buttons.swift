//
//  Buttons.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/8/23.
//

import SwiftUI

import SwiftUI

struct CustomButton: View {
    var text: String
    var background: Color = .orange
    var body: some View {
        Text(text)
            .foregroundColor(.cyan)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(25)
            .shadow(radius: 10)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Next")
    }
}

