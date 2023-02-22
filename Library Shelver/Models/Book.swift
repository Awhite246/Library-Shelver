//
//  Book.swift
//  Library Shelver
//
//  Created by Alistair White on 2/3/23.
//

import Foundation

struct Book : Hashable {
    var id = UUID()
    var title : String
    var dewey : Float
    var author : String
    var xPosition : CGFloat
    var width : CGFloat = 100
    var height: CGFloat = 300
}

import SwiftUI

//Creates a view which will be used for each book dislpayed
struct BookView: View {
    let book : Book
    var body: some View {
        ZStack {
            Color.green
            //tempory place holder in place of a book image
            Text("\(book.title)\nBy: \(book.author)\n\(book.dewey)")
                .multilineTextAlignment(.center)
        }
        .frame(width: book.width, height: book.height)
        .border(Color.black, width: 2)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: Book(title: "Book", dewey: 031.1, author: "Joe", xPosition: 0, width: 100, height: 300))
    }
}

