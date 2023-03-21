//
//  FictionView.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/15/23.
//

import SwiftUI
import AVFoundation
struct FictionView: View {
    @State private var player: AVAudioPlayer!
    @State var correct = false
    var body: some View {
        VStack () {
            HStack {
                NavigationLink {
                    ContentView()
                        .navigationBarBackButtonHidden()
                } label: {
                    BackButton()
                }
                .frame(alignment: .leading)
                Text("Fiction Sorter")
                    .foregroundColor(Color("Peach"))
                    .shadow(color: Color("Peach"), radius: 20)
                    .fontWeight(.bold)
                    .font(.title)
                    .frame(alignment: .center)
            }
            ShelfView(check: $correct) //displays the shelf of draggable books
        }
        .background(
            ZStack {
                Image("Shelf Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
        )
    }
}

struct FictionView_Previews: PreviewProvider {
    static var previews: some View {
        FictionView()
    }
}
