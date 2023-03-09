//
//  Sticker.swift
//  Library Shelver
//
//  Created by Alistair White on 3/8/23.
//

import SwiftUI

struct Sticker: View {
    let author: String
    let dewey: Double
    var body: some View {
        ZStack {
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 15))
            VStack {
                Text("\(author)")
                    .foregroundColor(.black)
                    .font(.system(size: 30).bold())
                Text("\(dewey, specifier: "%.2f")")
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.top, 10)
            }
        }
        .frame(width:70, height: 100)
    }
}

struct Sticker_Previews: PreviewProvider {
    static var previews: some View {
        Sticker(author: "JOE", dewey: 131.1)
    }
}
