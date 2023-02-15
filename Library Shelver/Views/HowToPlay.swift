//
//  HowToPlay.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/15/23.
//

import SwiftUI

struct HowToPlay: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 500)
            Text("How To Play?")
                .foregroundColor(Color.yellow)
                .fontWeight(.bold)
                .font(.title)
                Spacer()
                .frame(height: 300)
            Text(" - There are two gamemodes")
            Spacer()
                .frame(height: 900)
        } .background(
            ZStack {
                Image("chalkboard1")
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
