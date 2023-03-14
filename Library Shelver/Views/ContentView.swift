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
            ZStack {
                Color("Lion")
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    Text("Library Shelver")
                        .fontWeight(.bold)
                        .font(.system(size: 50))
                        .foregroundColor(Color("Bistre"))
                    NavigationLink {
                        DeweyView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        CustomButton(text: "Dewey")
                    }
                    .padding(.bottom, 5)
                    NavigationLink {
                        FictionView()
                    } label: {
                        CustomButton(text: "Fiction")
                    }
                    .padding(.bottom, 5)
                    HStack {
                        NavigationLink {
                            HowToPlay()
                        } label: {
                            CustomButton(text: "Help")
                        }
                        .padding(.horizontal, 55)
                        NavigationLink {
                            CertificateView()
                        } label: {
                            CustomButton(text: "Certificate")
                        }
                    }
                    .padding(.bottom, 5)
                }
            }
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
