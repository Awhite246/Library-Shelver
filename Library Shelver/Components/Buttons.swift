//
//  Buttons.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/8/23.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var background: Color = Color("Peach")
    var body: some View {
        Text(text)
            .font(.system(size: 25))
            .fontWeight(.semibold)
            .foregroundColor(Color("Falu Red"))
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(25)
            .shadow(radius: 10)
    }
}

struct BackButton: View {
    let size : CGFloat = 25
    var body: some View {
        Image(systemName: "arrow.backward.square.fill")
            .resizable()
            .frame(width: size, height: size)
            .foregroundColor(Color("Peach"))
            .shadow(color: Color("Bistre"), radius: size / 5)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}

