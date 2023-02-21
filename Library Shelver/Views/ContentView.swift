//
//  ContentView.swift
//  Library Shelver
//
//  Created by Alistair White & Victor Gunderson on 2/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Library Shelver")
                    .foregroundColor(Color.yellow)
                    .font(.title)
                    .fontWeight(.bold)
                // adding 3 navigation links for the two gamemodes and how to play page
                NavigationLink(destination: DeweyView()) {
                    Label("DEWEY", systemImage: "")
                        .foregroundColor(Color.green)
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
                .padding(30)
                NavigationLink(destination: FictionView()) {
                    Label("FICTION", systemImage: "")
                        .foregroundColor(Color.green)
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
                .padding(30)
                NavigationLink(destination: HowToPlay()) {
                    Label("HOW TO PLAY", systemImage: "")
                        .foregroundColor(Color.green)
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
            }
            .background(
                ZStack {
                    Image("chalkboard1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 1000, height: 300)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
