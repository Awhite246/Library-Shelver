//
//  CertificateView.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/27/23.
//

import SwiftUI

struct CertificateView: View {
    @State private var name = ""
    @State private var showingAlert = false
    var body: some View {
        VStack {
            
            TextField("Enter Name Here", text: $name)
                .padding(300)
                .alert("CONGRADULATIONS! Type your name in the area where it says to type it. Then show it to your librarian", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                        // normal alert usage, alert is presented when showing alert = true (1000 points)
                    }
                
                
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
