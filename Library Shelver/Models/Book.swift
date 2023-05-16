//
//  Book.swift
//  Library Shelver
//
//  Created by Alistair White on 2/3/23.
//

import Foundation
import SwiftUI

struct Book : Identifiable {
    var id = UUID()
    var info : BookInfo
    var xPosition : CGFloat = 0
    var width : CGFloat = 100
    var height: CGFloat = 300
    /*var textcolor: Color
     var textfont: Font
     var height: CGFloat
     var width: CGFloat
     var alignment: Alignment
     var textbackcolor: Color
     var corner: CGFloat
     */
    
    var horizontal = false
    //Colors
    var barColor : Color = .yellow
    var color1 : Color = .green
    var color2 : Color = .blue
}
struct BookInfo : Hashable, Codable, Identifiable {
    var id : Int
    var title : String
    var dewey : Double
    var author : String
    
}


struct BookView: View { //var bookInfo : BookInfo //Book View displays an individual book, which is then used multiple times to display multiple books in ShelfView
    let book : Book
    var body: some View {
        //tempory place holder in place of a book image
        ZStack {
            VStack(spacing: 0) {
                book.barColor
                    .frame(height: 20)
                VStack {
                    HStack(spacing: 0) {
                        if book.horizontal {
                            book.barColor
                            book.color1
                        } else {
                            book.color2
                            book.barColor
                        }
                    }
                }
            }
            .frame(width: book.width, height: book.height)
            .padding()
            VStack {
                Text("\(book.info.author)")
                    .font(.custom("AmericanTypewriter", fixedSize: 15))
                    .minimumScaleFactor(1.0)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .padding()
                    .padding(.vertical, 1)
                    .padding(.bottom, 1)
                Spacer()
                Text("\(book.info.title)")
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 120)
                    .font(.custom("AmericanTypewriter", fixedSize: 15))
                    .multilineTextAlignment(.center)
                    .rotationEffect(Angle(degrees: 90))
                    .font(.title3)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .shadow(color: .white, radius: 1)
                    .shadow(color: .white, radius: 1)
                Spacer()
                Sticker(author: book.info.author.prefix(3).uppercased(), dewey: book.info.dewey)
                    .padding(.vertical)
                    .padding(.bottom, 6)
            }
            
        }
        .frame(width: book.width, height: book.height)
        .border(Color.black, width: 2)
    }
    
    //Grows the size of the book
    //Activated when book is being dragged
    func grow() {
        
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: Book(info: BookInfo(id: 0, title: "Spooky Ghosts at Spooky Town", dewey: 031.1, author: "Joseph"), xPosition: 0, width: 80, height: 250))
    }
}
