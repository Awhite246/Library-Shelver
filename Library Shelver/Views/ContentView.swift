//
//  ContentView.swift
//  Library Shelver
//
//  Created by Alistair White & Victor Gunderson on 2/2/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var player: AVAudioPlayer!
    var body: some View {
        NavigationView {
            VStack {
                Text("Library Shelver")
                    .foregroundColor(Color.yellow)
                    .font(.title)
                    .fontWeight(.bold)
                // adding 3 navigation links for the two gamemodes and how to play page
                NavigationLink {
                    DeweyView()
                } label: {
                    CustomButton(text: "Start")
                }
                .padding(30)
                NavigationLink(destination: HowToPlay()) {
                    Label("HOW TO PLAY", systemImage: "")
                        .foregroundColor(Color.blue)
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
                
                NavigationLink(destination: CertificateView()) {
                    Label("certificate", systemImage: "")
                        .foregroundColor(Color.blue)
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
            }
            .background(
                ZStack {
                    Color.mint
                        .scaledToFill()
                        .frame(width: 1000, height: 300)
                }
            )
        }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
