//
//  SavedCertificate.swift
//  Library Shelver
//
//  Created by Alistair White on 3/23/23.
//

import SwiftUI

struct SavedCertificate: View {
    @ObservedObject var certificateList = CertificateList()
    var body: some View {
        List {
            ForEach(certificateList.certifcates) { certificate in
                HStack {
                    Text("")
                    //certificate.name
                }
            }
        }
    }
}

struct SavedCertificate_Previews: PreviewProvider {
    static var previews: some View {
        SavedCertificate()
    }
}
