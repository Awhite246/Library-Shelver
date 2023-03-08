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
    var subtitle : String = ""
    var dewey : Double
    var author : String
    var xPosition : CGFloat = 0
    var width : CGFloat = 100
    var height: CGFloat = 300
    
    var color : Color = .green //Temp
}

import SwiftUI

struct BookView: View { //Book View displays an individual book, which is then used multiple times to display multiple books in ShelfView
    let book : Book
    var body: some View {
        //tempory place holder in place of a book image
        ZStack {
            book.color
            VStack {
                Text("\(book.title)\nBy: \(book.author)\n\(book.dewey, specifier: "%.2f")")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 50)
                Sticker(author: book.author.suffix(3).uppercased(), dewey: book.dewey)
            }
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

