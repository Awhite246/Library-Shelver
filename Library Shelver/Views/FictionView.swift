//
//  FictionView.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/15/23.
//

import SwiftUI
import AVFoundation
struct FictionView: View {
    let name : String
    @ObservedObject var certificateList : CertificateList
    @State private var player: AVAudioPlayer!
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var correct = false
    @State var showCertificate = false
    @State var attempts = 0
    @State var date = Date.now
    @State private var showingAlert = false
    
    //PLACE HOLDER FOR REAL LIST
    @State var bookList = (0..<7).map { num in Book(info: BookInfo(id: 0, title: "Book \(num)", dewey: -1, author: "\(num % 2 == 0 ? (Bool.random() ? "Dabbin" : "Dabage") : "Smith")"), width: CGFloat.random(in: 80...120), height: CGFloat.random(in: 250...300), horizontal: Bool.random(), barColor: Bool.random() ? .yellow : .green, color1: Bool.random() ? .blue : .cyan, color2: Bool.random() ? .blue : .cyan) }
    
    var body: some View {
        VStack () {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    BackButton()
                }
                Spacer()
                Text("Fiction Sorter")
                    .foregroundColor(Color("Peach"))
                    .shadow(color: Color("Peach"), radius: 20)
                    .fontWeight(.bold)
                    .font(.title)
                    .frame(alignment: .center)
                Spacer()
                Button {
                    attempts += 1
                    if correct {
                        date = Date.now
                        certificateList.certifcates.append(Certificate(attempts: attempts, name: name, time: date, type: "iction"))
                        showCertificate = true
                        playSounds(sound: "winning")
                    } else {
                        playSounds(sound: "wrong")
                        showingAlert = true
                    }
                } label: {
                    VStack (spacing: 0) {
                        Image(systemName: "person.fill.checkmark")
                            .resizable()
                            .frame(width: 35, height: 25)
                        HStack {
                            Text("Check")
                                .shadow(radius: 40)
                                .font(.caption)
                            Text("\(attempts)")
                                .font(.system(size: 0))
                                .hidden()
                        }

                    }
                    .foregroundColor(Color("Peach"))
                }
                .offset(y: 5)
                
            }
            .padding()
            ShelfView(bookList: bookList, check: $correct) //displays the shelf of draggable books
        }
        .alert("Close One! Try it again. You Got This!", isPresented: $showingAlert){
            Button("OK", role: .cancel) { }
        }
        .background(
            ZStack {
                Image("Shelf Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
        )
        .fullScreenCover(isPresented: $showCertificate) {
            //When showCertifcate is true
            CertificateView(attempts: attempts, name: name, date: date, type: "Fiction")
        }
    }
    private func playSounds(sound: String) {
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
        FictionView(name: "George", certificateList: CertificateList())
    }
}
