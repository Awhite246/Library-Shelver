//
//  HowToPlay.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/15/23.
//

import SwiftUI

struct HowToPlay: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Image("Wood Background 2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Color("Peach")
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .frame(height: 350)
                .offset(x: -10, y: 10)
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        BackButton(background: Color("Bistre"),shadow: Color("Lion"))
                    }
                    .offset(x: 50)
                    Spacer()
                    Text("How To Play?")
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                        .foregroundColor(Color("Bistre"))
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding(.vertical, 5)
                .padding(.top)
                Text("""
Welcome to Library Shelver!

In this game, there are two gamemodes: Dewey and Fiction.

Drag the books to the correct order, then press the button CHECK

Once you have completed both games, you will recieve a certificate of completion.

""")
                .fontWeight(.bold)
                .font(.system(size: 25))
                .font(.title)
                .foregroundColor(Color("Bistre"))
            }
        }
    }
}

struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlay()
    }
}
