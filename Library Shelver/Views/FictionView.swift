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
    var body: some View {
        VStack {
            Text("Fiction Sorter")
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
    func playSounds(sound: String) {
        if let asset = NSDataAsset(name: sound){
            do {
                // Use NSDataAsset's data property to access the audio file stored in Sound.
                player = try AVAudioPlayer(data:asset.data, fileTypeHint:"wav")
                // Play the above sound file.
                player?.play()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}

struct FictionView_Previews: PreviewProvider {
    static var previews: some View {
        FictionView()
    }
}
