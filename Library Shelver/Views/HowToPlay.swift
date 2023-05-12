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
                .ignoresSafeArea()
            Color("Peach")
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .frame(height: 360)
                .padding(.horizontal)
            VStack {
                Spacer()
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        BackButton(background: Color("Bistre"),shadow: Color("Lion"))
                    }
                    .offset(x: 50)
                    Spacer()
                    Text("How To Play?")
                        .font(Font.custom("Baskerville", size: 35))
                        .fontWeight(.bold)
                        .font(.system(size: 35))
                        .foregroundColor(Color("Bistre"))
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                Text("Welcome to Library Shelver!\nIn this game, there are two gamemodes: Non-Fiction and Fiction.\nDrag the books to sort them numericaly and alphabetically.\nPress the button CHECK to check your answer.\nOnce you have completed either game, you will recieve a certificate of completion.\nGood Luck!!")
                    .lineSpacing(10)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .font(.title)
                    .foregroundColor(Color("Bistre"))
                Spacer()
            }
        }
    }
}

struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlay()
    }
}
