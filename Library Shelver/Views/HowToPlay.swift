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
            Color("Lion")
                .ignoresSafeArea()
                .scaledToFill()
            Color("Peach")
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .frame(height: 350)
                .offset(x: -10, y: 10)
            VStack {
                Text("How To Play?")
                    .fontWeight(.bold)
                    .font(.system(size: 50))
                    .foregroundColor(Color("Bistre"))
                    .padding(30)
                Text("""
• There are two gamemodes: Dewey and Fiction

• Drag the books to the correct order, then press the button CHECK

• Once you completed both games, you will recieve a certificate

""") .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color("Bistre"))
                
            
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
