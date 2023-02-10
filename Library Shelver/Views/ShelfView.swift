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
    @State var bookList = (0...5).map { num in Book(title: "Title", dewey: 123.45, author: "Author", offset: (200 - CGFloat(num * 100))) }
    @State var position = 0.0
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
            ZStack {
                Group {
                    ForEach(0..<6) { i in
                        BookView(book: bookList[i])
                            .offset(x: bookList[i].offset)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        
                                        bookList[i].offset = gesture.location.x
                                        //Dynamicly change positions
                                        //each time the book passes halfway through another book it switches positions
                                        position = bookList[i].offset
                                    }
                                    //update 'start' position of books on release
                                    .onEnded { _ in
                                        
                                    }
                            )
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
            }
        }
    }
}

struct ShelfView_Previews: PreviewProvider {
    static var previews: some View {
        ShelfView()
    }
}
