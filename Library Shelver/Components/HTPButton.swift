//
//  HTPButton.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 3/8/23.
//

import SwiftUI

struct HTPButton: View {
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

struct HTPButton_Previews: PreviewProvider {
    static var previews: some View {
        HTPButton(text: "How To Play")
    }
}

