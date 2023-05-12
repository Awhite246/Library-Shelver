//
//  CustomAlert.swift
//  Library Shelver
//
//  Created by Alistair White on 5/2/23.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var showAlert : Bool
    @State var title : String
    @State var message : String
    @State var backgroundColor : Color = Color("Peach")
    @State var primaryButton : String
    @State var secondaryButton : String
    @State var action : () -> Void
    var body: some View {
        VStack {
            Text(title)
                .font(.title2).bold()
                .foregroundColor(Color.black)
            Text(message)
                .foregroundColor(Color.black)
                .padding(.bottom)
            HStack {
                //Primary Button
                Button {
                    action()
                } label: {
                    Text("Left Button")
                }
                .padding(.horizontal)
                //Dismiss Button
                Button {
                    showAlert = false
                } label: {
                    Text("Right Button")
                }
                .padding(.horizontal)
            }
            
        }
        .frame(maxWidth: 300)
        .padding(.all)
        .background(RoundedRectangle(cornerRadius: 15).foregroundColor(backgroundColor))
        .opacity(0.95)
        .preferredColorScheme(.dark)
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(showAlert: .constant(true), title: "Title", message: "Hi", primaryButton: "Button 1", secondaryButton: "Button 2") {
            //nothing
        }
    }
}
