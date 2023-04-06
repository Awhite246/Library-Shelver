//
//  ContentView.swift
//  Library Shelver
//
//  Created by Alistair White & Victor Gunderson on 2/2/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @ObservedObject var certificateList = CertificateList()
    @State private var player: AVAudioPlayer!
    @State var name = ""
    @State var submit = false
    @State var submitShake = false
    @State var settingShake = false
    @State var deweyList = [Book]()
    @State var fictionList = [Book]()
    var body: some View {
        NavigationView {
            ZStack {
                Image("Wood Background 2")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Spacer()
                        Text("Library Shelver")
                            .fontWeight(.bold)
                            .font(.system(size: 50))
                            .foregroundColor(Color("Bistre"))
                            .shadow(color: Color("Peach"),radius: 10)
                            .shadow(color: Color("Peach"),radius: 2)
                            .multilineTextAlignment(.center)
                        Spacer()
                        NavigationLink {
                            SettingView(certificateList: certificateList, name: $name)
                                .navigationBarBackButtonHidden()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(Color("Peach"))
                                    .frame(width: 30, height: 30)
                                    .shadow(color: Color("Bistre"),radius: 15)
                                    .shadow(color: Color("Bistre"),radius: 5)
                                Image(systemName: "gearshape.fill")
                                    .resizable()
                                    .foregroundColor(Color("Bistre"))
                                    .frame(width: 25, height: 25)
                            }
                        }
                        Spacer()
                    }
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
                                        submitShake = true
                                    }
                                } label: {
                                    CustomButton(text: "Submit")
                                }
                                .shake($submitShake) {
                                    print("Finished")
                                }
                                
                            }
                        }
                        else {
                            VStack {
                                NavigationLink {
                                    DeweyView(name: name, certificateList: certificateList, bookList: deweyList)
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    CustomButton(text: "Dewey")
                                }
                                .padding(.bottom, 5)
                                NavigationLink {
                                    FictionView(name: name, certificateList: certificateList, bookList: fictionList)
                                        .navigationBarBackButtonHidden()
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
                                .navigationBarBackButtonHidden()
                        } label: {
                            CustomButton(text: "Help")
                        }
                        .padding(.horizontal, 55)
                        NavigationLink {
                            SavedCertificate(certificateList: certificateList)
                                .navigationBarBackButtonHidden()
                        } label: {
                            CustomButton(text: "Certificate")
                        }
                    }
                    .padding(.bottom, 5)
                }
            }
        }
        .onAppear {
            deweyList = fillDeweyList()
            fictionList = fillFictionList()
            if !certificateList.certifcates.isEmpty {
                name = certificateList.certifcates.last!.name
                submit = true
            }
        }
    }
    
    func fillDeweyList() -> [Book] {
        let deweyInfo = deweyData.shuffled().prefix(7)
        var deweyList = [Book]()
        for info in deweyInfo {
            let isHalved = Bool.random()
            let baseColor = colorList.randomElement()!
            deweyList.append(Book(info: info, width: CGFloat.random(in: 80...120), height: CGFloat.random(in: 250...300), horizontal: Bool.random(), barColor: baseColor, color1: (isHalved ? colorList.randomElement()! : baseColor), color2: (isHalved ? colorList.randomElement()! : baseColor)))
        }
        return deweyList
    }
    func fillFictionList() -> [Book] {
        let fictionInfo = fictionData.shuffled().prefix(7)
        var fictonList = [Book]()
        for info in fictionInfo {
            let isHalved = Bool.random()
            let baseColor = colorList.randomElement()!
            fictonList.append(Book(info: info, width: CGFloat.random(in: 80...120), height: CGFloat.random(in: 250...300), horizontal: Bool.random(), barColor: baseColor, color1: (isHalved ? colorList.randomElement()! : baseColor), color2: (isHalved ? colorList.randomElement()! : baseColor)))
        }
        return fictonList
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
