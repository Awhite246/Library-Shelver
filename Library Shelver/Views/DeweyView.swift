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
        VStack {
            Text("Dewey Sorter")
                .foregroundColor(Color.yellow)
                .fontWeight(.bold)
                .font(.title)
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
