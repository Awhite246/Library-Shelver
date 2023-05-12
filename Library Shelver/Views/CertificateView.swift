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
    @State var type : String
    var body: some View {
        NavigationView {
            ZStack {
                Image("Wood Background")
                    .resizable()
                    .ignoresSafeArea()
                Color("Peach")
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(height: 350)
                    .padding(.horizontal)
                VStack {
                    Text("Congratulations!")
                        .font(Font.custom("Baskerville", size: 80))
                        .font(.system(size: 80))
                        .foregroundColor(Color("Bistre"))
                        .bold()
                        .shadow(color: .yellow, radius: 50)
                    Group {
                        Text(name)
                            .font(Font.custom("Baskerville", size: 50))
                            .font(.system(size: 40))
                        Text("Has Completed the \(type) Library Shelver in \n\(attempts) Attempt\(attempts > 1 ? "s" : "")")
                            .multilineTextAlignment(.center)
                            .font(Font.custom("Baskerville", size: 28))
                            .font(.title)
                            .padding(.bottom, 10)
                        
                        if attempts > 0 && !savedCertificate {
                            NavigationLink {
                                ContentView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                HStack {
                                    Image(systemName: "arrow.counterclockwise.circle.fill")
                                    Text("Try Again?")
                                        .font(Font.custom("Baskerville", size: 25))
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
                        } else {
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                HStack {
                                    Image(systemName: "arrow.backward.square.fill")
                                    Text("Go Back")
                                    
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
                        }
                        Text("Completion Date:\n \(date.formatted(date: .abbreviated, time: .shortened))")
                            .multilineTextAlignment(.center)
                            .font(.title3)
                    }
                    .foregroundColor(Color("Brown"))
                    .fontWeight(.semibold)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CertificateView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateView(attempts: 1, name: "George", type: "Fiction")
    }
}
