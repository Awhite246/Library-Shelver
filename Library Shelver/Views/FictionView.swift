//
//  FictionView.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/15/23.
//

import SwiftUI

struct FictionView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 500)
            Text("Fiction Sorter")
                .foregroundColor(Color.yellow)
                .fontWeight(.bold)
                .font(.title)
            Spacer()
                .frame(height: 300)
            ShelfView() //displays the shelf of draggable books
            Spacer()
                .frame(height: 900)
        } .background(
            ZStack {
                Image("viewBackgrounds")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 750, height: 200)
            }
        )
    }
}

struct FictionView_Previews: PreviewProvider {
    static var previews: some View {
        FictionView()
    }
}
