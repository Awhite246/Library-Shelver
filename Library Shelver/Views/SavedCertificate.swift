//
//  SavedCertificate.swift
//  Library Shelver
//
//  Created by Alistair White on 3/23/23.
//

import SwiftUI

struct SavedCertificate: View {
    @ObservedObject var certificateList : CertificateList
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Image("Wood Background 2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        BackButton()
                    }
                    Spacer()
                    Text("Saved Certificates")
                        .foregroundColor(Color("Peach"))
                        .shadow(color: Color("Peach"), radius: 20)
                        .fontWeight(.bold)
                        .font(.title)
                        .frame(alignment: .center)
                    Spacer()
                }
                .padding()
                List {
                    HStack {
                        Text("Attempts")
                        Spacer()
                        Text("Type")
                            .padding(.trailing, 75)
                            .padding(.leading, -75)
                        Spacer()
                        Text("Completion Date")
                    }
                    .bold()
                    .foregroundColor(Color("Bistre"))
                    .listRowBackground(Color("Peach"))
                    ForEach(certificateList.certifcates) { certificate in
                        NavigationLink {
                            CertificateView(attempts: certificate.attempts, name: certificate.name, date: certificate.time, savedCertificate: true, type: certificate.type)
                                .navigationBarBackButtonHidden()
                        } label: {
                            HStack {
                                Text("\(certificate.attempts)")
                                Spacer()
                                Text("\(certificate.type)")
                                Spacer()
                                Text(" \(certificate.time.formatted(date: .abbreviated, time: .shortened))")
                            }
                            .foregroundColor(Color("Bistre"))
                        }
                        .listRowBackground(Color("Peach"))
                    }
                }
                .scrollContentBackground(.hidden)
                Spacer()
            }
        }
    }
}

struct SavedCertificate_Previews: PreviewProvider {
    static var previews: some View {
        SavedCertificate(certificateList: CertificateList())
    }
}
