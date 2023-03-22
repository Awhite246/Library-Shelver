//
//  CertificateView.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/27/23.
//

import SwiftUI

struct CertificateView: View {
    @State var attempts : Int
    @State var name : String
    @State var date = Date.now
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("Lion")
                .ignoresSafeArea()
                .scaledToFill()
            Color("Peach")
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .frame(height: 350)
                .offset(x: -10, y: 10)
            VStack {
                Text("Congratulations!")
                    .font(.system(size: 80))
                    .foregroundColor(Color("Bistre"))
                    .bold()
                    .shadow(color: .yellow, radius: 50)
                Group {
                    Text(name)
                        .font(.system(size: 40))
                    Text("Has Completed the Fiction Library Shelver in \n\(attempts) Attempt\(attempts > 1 ? "s" : "")")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .padding(.bottom, 30)
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        if attempts > 0 {
                            Text("Try Again")
                        } else {
                            Image(systemName: "arrow.backward.square.fill")
                            Text("Go Back")
                        }
                    }
                    .font(.title2)
                    
                    Text("Completion Date:\n \(date.formatted(date: .abbreviated, time: .shortened))")
                        .multilineTextAlignment(.center)
                        .font(.title3)
                }
                .foregroundColor(Color("Brown"))
                .fontWeight(.semibold)
            }
        }
    }
}

struct CertificateView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateView(attempts: 0, name: "George")
    }
}
