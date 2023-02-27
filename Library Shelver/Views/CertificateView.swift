//
//  CertificateView.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/27/23.
//

import SwiftUI

struct CertificateView: View {
    @State private var name = ""
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 0)
            TextField("Enter Name Here", text: $name)
                .padding(300)
            Text("Take a screenshot or show this to the librarian")
            Spacer()
                .frame(height: 0)
        } .background(
            ZStack {
                Image("certificate")
                    .resizable()
                    .frame(width: 800, height: 400)
            }
        )
    }
}

struct CertificateView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateView()
    }
}
