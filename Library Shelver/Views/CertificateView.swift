//
//  CertificateView.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/27/23.
//

import SwiftUI

struct CertificateView: View {
    @State var attempts : Int
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
                Text("You have completed library shelver in \(attempts) attempts")
                    .foregroundColor(Color("Brown"))
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 90)
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
                .foregroundColor(Color("Brown"))
                .fontWeight(.bold)
                Text("Completion Date:\n \(date.formatted(date: .abbreviated, time: .shortened))")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .foregroundColor(Color("Brown"))
                    .fontWeight(.semibold)
            }
        }
    }
}

struct CertificateView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateView(attempts: 0)
    }
}
