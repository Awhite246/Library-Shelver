//
//  HowToPlay.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/15/23.
//

import SwiftUI

struct HowToPlay: View {
    var body: some View {
        ZStack {
            Color("Peach")
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("How To Play?")
                    .fontWeight(.bold)
                    .font(.system(size: 50))
                    .foregroundColor(Color("Bistre"))
                    .padding(30)
                Text(" - There are two gamemodes")
            }
        } .background(
            ZStack {
                Image("peach")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 750, height: 200)
            }
        )
    }
}

struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlay()
    }
}
