//
//  SettingView.swift
//  Library Shelver
//
//  Created by Alistair White on 4/3/23.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var certificateList : CertificateList
    @State var changeName = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var name : String
    @State var tempName = ""
    @State var shake = false
    var body: some View {
        ZStack {
            Image("Wood Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        BackButton()
                    }
                    Spacer()
                    Text("Settings")
                        .fontWeight(.bold)
                        .font(.system(size: 50))
                        .foregroundColor(Color("Bistre"))
                        .shadow(color: Color("Peach"),radius: 10)
                        .shadow(color: Color("Peach"),radius: 2)
                        .multilineTextAlignment(.center)
                        .padding(.trailing)
                    Spacer()
                    Spacer()
                }
                .padding(.top)
                Button {
                    certificateList.certifcates.removeAll()
                } label: {
                    CustomButton(text: "Clear Save")
                }
                .padding(.vertical)
                if changeName {
                    VStack {
                        TextField("Enter your name here", text: $tempName)
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
                            if tempName.count > 1 {
                                name = tempName
                                changeName = false
                            } else {
                                shake = true
                            }
                        } label: {
                            CustomButton(text: "Submit")
                        }
                        .shake($shake) {
                            print("Finished")
                        }
                        .padding(.top)
                    }
                }
                else {
                    Button {
                        changeName = true
                    } label: {
                        CustomButton(text: "Change Name")
                    }
                    .padding(.vertical)
                }
                Spacer()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(certificateList: CertificateList(), name: .constant("George"))
    }
}
