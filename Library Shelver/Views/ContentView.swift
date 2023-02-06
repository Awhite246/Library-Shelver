//
//  ContentView.swift
//  Library Shelver
//
//  Created by Alistair White on 2/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
