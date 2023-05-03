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
    @State var backgroundColor : Color = Color.white
    var body: some View {
        ZStack {
            //Used to check background visibility / opactiy testing
            Color.red
                .frame(width:50,height:50)
            VStack {
                Text(title)
                    .font(.title2).bold()
                    .foregroundColor(Color.black)
                Text(message)
                    .foregroundColor(Color.black)
                    .padding(.bottom)
                HStack {
                    //Left Button
                    Button {
                        message += "Hi"
                    } label: {
                        Text("Left Button")
                    }
                    .padding(.horizontal)
                    //Right Button
                    Button {
                        message.removeLast(2)
                    } label: {
                        Text("Right Button")
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.all)
            .background(RoundedRectangle(cornerRadius: 15).foregroundColor(backgroundColor))
            .opacity(0.9)
        }
        .preferredColorScheme(.dark)
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(showAlert: .constant(true), title: "Title", message: "Hi")
    }
}
