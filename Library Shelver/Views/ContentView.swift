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
    @State var name = ""
    @State var submit = false
    @State var shake = false
    var body: some View {
        NavigationView {
            ZStack {
                Image("Wood Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    Text("Library Shelver")
                        .fontWeight(.bold)
                        .font(.system(size: 50))
                        .foregroundColor(Color("Bistre"))
                        .shadow(color: Color("Peach"),radius: 10)
                        .shadow(color: Color("Peach"),radius: 2)
                    ZStack {
                        if !submit {
                            VStack {
                                TextField("Enter your name here", text: $name)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 25))
                                    .foregroundColor(Color("Falu Red"))
                                    .padding()
                                    .padding(.horizontal)
                                    .background {
                                        Color("Peach")
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                            .padding(.horizontal, 75)
                                            .shadow(radius: 10)
                                    }
                                Button {
                                    if name.count > 1 {
                                        submit = true
                                    } else {
                                        shake = true
                                    }
                                } label: {
                                    CustomButton(text: "Submit")
                                }
                                .shake($shake) {
                                    print("Finished")
                                }
                                
                            }
                        }
                        else {
                            VStack {
                                NavigationLink {
                                    DeweyView(name: name)
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
                            }
                            .disabled(name.count < 1)
                        }
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
                            CertificateView(attempts: -1, name: "")
                                .navigationBarBackButtonHidden()
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
