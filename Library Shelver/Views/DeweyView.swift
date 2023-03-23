//
//  DeweyView.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/15/23.
//

import SwiftUI
import AVFoundation
struct DeweyView: View {
    let name : String
    @ObservedObject var certificateList : CertificateList
    @State private var player: AVAudioPlayer!
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var correct = false
    @State var attempts = 0
    @State var showCertificate = false
    
    @State var bookList = (0..<7).map { num in Book(info: BookInfo(id: 0, title: "Book \(num)", dewey: (Bool.random() ? Double(num) : 1.0), author: "\(num % 2 == 0 ? (Bool.random() ? "Dabbin" : "Dabage") : "Smith")"), width: CGFloat.random(in: 80...120), height: CGFloat.random(in: 250...300), horizontal: Bool.random(), barColor: Bool.random() ? .yellow : .green, color1: Bool.random() ? .blue : .cyan, color2: Bool.random() ? .blue : .cyan) } //placeholder for actual randomized book list
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    BackButton()
                }
                Spacer()
                Text("Dewey Sorter")
                    .foregroundColor(Color("Peach"))
                    .shadow(color: Color("Peach"), radius: 20)
                    .fontWeight(.bold)
                    .font(.title)
                    .frame(alignment: .center)
                Spacer()
                Button {
                    attempts += 1
                    if correct {
                        showCertificate = true
                        playSounds(sound: "winning")
                    } else {
                        playSounds(sound: "wrong")
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
        .background(
            ZStack {
                Image("Shelf Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
        )
        .fullScreenCover(isPresented: $showCertificate, onDismiss: {
            //When the cerficate is closed
            attempts = 0
            //Re-shuffle list (and maybe do new books?)
            //Temp solution
            @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
            
//            for i in 0..<bookList.count {
//                var newBook = bookList[i]
//                newBook.xPosition = 0
//                bookList[i] = newBook
//            }
//            bookList.shuffle()
        }) {
            //When showCertifcate is true
            CertificateView(attempts: attempts, name: name, certificateList: certificateList)
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


struct DeweyView_Previews: PreviewProvider {
    static var previews: some View {
        DeweyView(name : "George", certificateList: CertificateList())
    }
}
