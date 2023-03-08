//
//  PlayScreen.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 3/8/23.
//

import SwiftUI

struct PlayScreen: View {
    @State private var name = ""
    var body: some View {
        VStack {
            Text("Enter Name Below, Then Select Name Below")
                .fontWeight(.bold)
                .font(.title)
                .padding(30)
            TextField("Enter Name Here", text: $name)
                
            NavigationLink(destination: FictionView()) {
                Label("Fiction", systemImage: "")
                    .foregroundColor(Color.blue)
                    .font(.title)
                    .fontWeight(.bold)
                
            }
            NavigationLink(destination: DeweyView()) {
                Label("Dewey", systemImage: "")
                    .foregroundColor(Color.blue)
                    .font(.title)
                    .fontWeight(.bold)
                
            }
            
        } .background(
            ZStack {
                Color.mint
                    .scaledToFill()
                    .frame(width: 1000, height: 300)
            }
        )
    }
}

struct PlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayScreen()
    }
}
