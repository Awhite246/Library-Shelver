//
//  ShelfView.swift
//  Library Shelver
//
//  Created by Alistair White on 2/6/23.
//

import SwiftUI

//displays books and allows dragging around for reordering
struct ShelfView: View {
    //placeholder for actual randomized book list
    @State var bookList = (0...5).map { num in Book(title: "Book", dewey: 1, author: "\(num)", xPosition: (50 + CGFloat(num * 55))) }
    @State var position = 0.0
    @State var currentBook = -1 //keeps track of which book is being dragged, so more than one book can't be dragged at once
    
    let arraySize = 6 //used for testing, and so changing array size is easier
    
    var body: some View {
        /* Sudo Code:
         * Display a bunch of books (ZStack?)
         * Simulate HStack through .offset
         * Book spillage (off screen) moves next book to next shelf
         * Have drag gesture change offset of book
         * Use .onChange to dynamicly update other book positions
         * Use .onEnded to finalize book positions
         * Update book positions (array?) that checker will use
         */
        VStack {
            Text("\(position)")
            Text("\(currentBook)")
            ZStack {
                Group {
                    ForEach(0..<arraySize) { i in
                        BookView(book: bookList[i])
                            .position(x: bookList[i].xPosition)
                            //.offset(x: bookList[i].offset)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        //checks if there is a current book or not
                                        if currentBook < 0 {
                                            currentBook = i
                                        }
                                        if i == currentBook {
                                            //moves the book your dragging
                                            bookList[i].xPosition = gesture.location.x
                                        }
                                        //Dynamicly change other book positions, parting the waters
                                        
                                        if i > 0 && bookList[i].xPosition < bookList[i - 1].xPosition { //checking moving left, when position is less than the book behind
                                            bookList[i - 1].xPosition = CGFloat(50 + (i * 55))
                                        }
                                        if i < arraySize - 1 && bookList[i].xPosition > bookList[i + 1].xPosition {
                                            //checking moving right, when position is greater than book ahead
                                            bookList[i + 1].xPosition = CGFloat(50 + (i * 55))
                                        }
                                        
                                        position = bookList[i].xPosition
                                    }
                                    //update 'start' position of books on release
                                    .onEnded { _ in
                                        //resets current book so a new book can be dragged
                                        currentBook = -1
                                        //sorts the books by position, then spreads them out
                                        bookList.sort { $0.xPosition < $1.xPosition}
                                        for i in 0..<6 {
                                            bookList[i].xPosition = CGFloat(50 + (i * 55))
                                        }
                                    }
                            )
                    }
                }
                .offset(y: 100)
            }
        }
    }
}

struct ShelfView_Previews: PreviewProvider {
    static var previews: some View {
        ShelfView()
    }
}
