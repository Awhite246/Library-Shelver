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
    
    @State private var player: AVAudioPlayer!
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var correct = false
    @State var attempts = 0
    @State var showCertificate = false
    
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
            ShelfView(check: $correct) //displays the shelf of draggable books
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


struct DeweyView_Previews: PreviewProvider {
    static var previews: some View {
        DeweyView(name : "George")
    }
}
