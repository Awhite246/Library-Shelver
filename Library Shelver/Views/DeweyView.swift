//
//  DeweyView.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/15/23.
//

import SwiftUI

struct DeweyView: View {
    @State var bookList = (0...5).map { num in Book(title: "Book", dewey: 1, author: "\(num)", xPosition: (50 + CGFloat(num * 55))) }
    
    let arraySize = 6
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 500)
            Text("Dewey Sorter")
                .foregroundColor(Color.yellow)
                .fontWeight(.bold)
                .font(.title)
            Spacer()
                .frame(height: 300)
            ShelfView(bookList: bookList) //displays the shelf of draggable books
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

struct DeweyView_Previews: PreviewProvider {
    static var previews: some View {
        DeweyView()
    }
}
