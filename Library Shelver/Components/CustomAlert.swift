//
//  CustomAlert.swift
//  Library Shelver
//
//  Created by Alistair White on 5/2/23.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var showAlert : Bool
    var body: some View {
        Text("Hello, World!")
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(showAlert: .constant(true))
    }
}
