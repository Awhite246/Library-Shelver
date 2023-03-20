//
//  DeweyView.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/15/23.
//

import SwiftUI
import AVFoundation
struct DeweyView: View {
    @State private var player: AVAudioPlayer!
    var body: some View {
        VStack (alignment: .customCenter) {
            HStack {
                NavigationLink {
                    ContentView()
                        .navigationBarBackButtonHidden()
                } label: {
                    BackButton()
                }
                .frame(alignment: .leading)
                Text("Dewey Sorter")
                    .foregroundColor(Color("Peach"))
                    .shadow(color: Color("Peach"), radius: 20)
                    .fontWeight(.bold)
                    .font(.title)
                    .frame(alignment: .center)
                    .alignmentGuide(.customCenter) {
                        $0[HorizontalAlignment.center]
                    }
            }
            ShelfView() //displays the shelf of draggable books
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

struct DeweyView_Previews: PreviewProvider {
    static var previews: some View {
        DeweyView()
    }
}
