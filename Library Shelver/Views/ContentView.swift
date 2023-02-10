//
//  ContentView.swift
//  Library Shelver
//
//  Created by Alistair White on 2/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 500)
                
                Text("Library Shelver")
                    .foregroundColor(Color.yellow)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 400)
                // adding 3 navigation links for the two gamemodes and how to play page
                NavigationLink(destination: ShelfView()) {
                    Label("DEWEY", systemImage: "")
                        .foregroundColor(Color.green)
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
                .padding(30)
                NavigationLink(destination: ShelfView()) {
                    Label("FICTION", systemImage: "")
                        .foregroundColor(Color.green)
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
                .padding(30)
                NavigationLink(destination: ShelfView()) {
                    Label("HOW TO PLAY", systemImage: "")
                        .foregroundColor(Color.green)
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
                Spacer()
                    .frame(height: 400)
            } .background(
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
