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
    @State var savedCertificate = false
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
                        .padding(.bottom, 10)
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            if attempts > 0 && !savedCertificate {
                                Image(systemName: "arrow.counterclockwise.circle.fill")
                                Text("Try Again?")
                            } else {
                                Image(systemName: "arrow.backward.square.fill")
                                Text("Go Back")
                            }
                        }
                        .foregroundColor(Color("Peach"))
                        .shadow(color: Color("Falu Red"),radius: 1)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color("Lion"))
                                .padding(.horizontal, -10)
                                .padding(.vertical, -5)
                        }
                    }
                    .padding(10)
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
        CertificateView(attempts: 1, name: "George")
    }
}
