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
    
    @State private var player: AVAudioPlayer!
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var correct = false
    @State var showCertificate = false
    @State var attempts = 0
    
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
                        showCertificate = true
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
        .fullScreenCover(isPresented: $showCertificate) {
            CertificateView(attempts: attempts, name: name)
        }
    }
}

struct FictionView_Previews: PreviewProvider {
    static var previews: some View {
        FictionView(name: "George")
    }
}
