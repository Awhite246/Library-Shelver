//
//  Book.swift
//  Library Shelver
//
//  Created by Alistair White on 2/3/23.
//

import Foundation

struct Book : Identifiable {
    var id = UUID()
    var info : BookInfo
    var xPosition : CGFloat = 0
    var width : CGFloat = 100
    var height: CGFloat = 300
    
    var horizontal = false
    //Colors
    var barColor : Color = .yellow
    var color1 : Color = .green
    var color2 : Color = .blue
}
struct BookInfo : Codable, Identifiable {
    var id : Int
    var title : String
    var dewey : Double
    var author : String
}

import SwiftUI

struct BookView: View { //Book View displays an individual book, which is then used multiple times to display multiple books in ShelfView
    let book : Book
    var body: some View {
        //tempory place holder in place of a book image
        ZStack {
            VStack(spacing: 0) {
                book.barColor
                    .frame(height: 20)
                if book.horizontal {
                    VStack(spacing: 0) {
                        book.color1
                        book.color2
                    }
                } else {
                    VStack {
                        HStack(spacing: 0) {
                            book.color1
                            book.color2
                        }
                    }
                }
            }
            .frame(width: book.width, height: book.height)
            VStack {
                Text("\(book.info.author)")
                    .multilineTextAlignment(.center)
                    .foregroundColor(book.barColor)
                    .fontWeight(.semibold)
                    .padding(.vertical, 1)
                    .padding(.bottom, 50)
                    .colorInvert()
                Text("\(book.info.title)")
                    .multilineTextAlignment(.center)
                    .rotationEffect(Angle(degrees: 90))
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Sticker(author: book.info.author.prefix(3).uppercased(), dewey: book.info.dewey)
                    .padding(.vertical)
                
            }
        }
        .frame(width: book.width, height: book.height)
        .border(Color.black, width: 2)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: Book(info: BookInfo(id: 0, title: "How to fry your eggs", dewey: 031.1, author: "Joseph"), xPosition: 0, width: 100, height: 300))
    }
}

