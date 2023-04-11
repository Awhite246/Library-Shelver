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
    @State var colorList : [Color] = [
        Color(red: 1/255, green: 253/255, blue: 246/255), //Fluorescent cyan
        Color(red: 203/255, green: 186/255, blue: 237/255), //Periwinkle
        Color(red: 233/255, green: 233/255, blue: 0), //Aureolin
        Color(red: 3/255, green: 252/255, blue: 186/255), //Aquamarine
        Color(red: 42/255, green: 157/255, blue: 143/255), //Persian green
        Color(red: 233/255, green: 196/255, blue: 106/255), //Saffron
        Color(red: 244/255, green: 162/255, blue: 97/255), //Sandy Brown
        Color(red: 231/255, green: 111/255, blue: 81/255), //Burnt sienna
        Color(red: 34/255, green: 116/255, blue: 165/255), //UCLA Blue
        Color(red: 241/255, green: 196/255, blue: 15/255), //Jonquil
        Color(red: 0, green: 204/255, blue: 102/255), //Emerald
        Color(red: 253/255, green: 197/255, blue: 245/255), //Pink lavender
        Color(red: 247/255, green: 174/255, blue: 248/255), //Plum (web)
        Color(red: 179/255, green: 136/255, blue: 235/255), //Lavender (floral)
        Color(red: 128/255, green: 147/255, blue: 241/255), //Vista Blue
        Color(red: 114/255, green: 221/255, blue: 247/255) //Sky blue
    ]
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
                                    CustomButton(text: "Non-Fiction")
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
            deweyList.append(Book(info: info, width: CGFloat.random(in: 80...120), height: CGFloat.random(in: 250...300), horizontal: false, barColor: baseColor, color1: (isHalved ? colorList.randomElement()! : baseColor), color2: (isHalved ? colorList.randomElement()! : baseColor)))
        }
        return deweyList
    }
    func fillFictionList() -> [Book] {
        let fictionInfo = fictionData.shuffled().prefix(7)
        var fictonList = [Book]()
        for info in fictionInfo {
            let isHalved = Bool.random()
            let baseColor = colorList.randomElement()!
            fictonList.append(Book(info: info, width: CGFloat.random(in: 80...120), height: CGFloat.random(in: 250...300), horizontal: false, barColor: baseColor, color1: (isHalved ? colorList.randomElement()! : baseColor), color2: (isHalved ? colorList.randomElement()! : baseColor)))
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
