//
//  PlayScreen.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 3/8/23.
//

import SwiftUI

struct PlayScreen: View {
    var body: some View {
            VStack {
                Text("Library Shelver")
                    .fontWeight(.bold)
                    .font(.system(size: 50))
                    .foregroundColor(Color("Bistre"))
                    .padding(30)
                NavigationLink {
                    DeweyView()
                } label: {
                    CustomButton(text: "Dewey")
                }
                .padding(30)
                NavigationLink {
                    FictionView()
                } label: {
                    CustomButton(text: "Fiction")
                }
            }
        }
}

struct PlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayScreen()
    }
}
