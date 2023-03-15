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
                    
                Text("(Dewey and Fiction)")
                    .fontWeight(.bold)
                Text("Click to drag the books in the correct order")
                Text("Click the CHECK button to see if you positioned the books right.")
                    .fontWeight(.bold)
                Text("Repeat the same process in the other gamemode you havent done")
                Text("If you completed both games without any fails, you will recieve a certificate")
                    .fontWeight(.bold)
                Text("Show the certificate to your librarian to get accepted for your position")
                Text("CONGRADULATIONS!")
                    .fontWeight(.bold)
                    .font(.system(size: 50))
                    .foregroundColor(Color("Bistre"))
                    .padding(30)
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
}

struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlay()
    }
}
