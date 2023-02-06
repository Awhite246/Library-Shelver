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
}

import SwiftUI

//Creates a view which will be used for each book dislpayed
struct BookView: View {
    let book : Book
    var body: some View {
        VStack {
            //tempory place holder in place of a book image
            Text("\(book.title)\nBy: \(book.author)\n\(book.dewey)")
                .multilineTextAlignment(.center)
                .border(Color.black, width: 1)
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: Book(title: "Book", dewey: 031.1, author: "Joe"))
    }
}

