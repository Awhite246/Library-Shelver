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
    @State var bookList = (0...5).map { num in Book(title: "Title", dewey: 123.45, author: "Author", offset: 0) }
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
        
        ZStack {
            HStack {
                ForEach(0..<6) { i in
                    BookView(book: bookList[i])
                        .offset(x: bookList[i].offset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    bookList[i].offset = gesture.translation.width
                                    //Dynamicly change positions
                                    
                                }
                                .onEnded { _ in
                                    
                                }
                        )
                }
            }
        }
    }
}

struct ShelfView_Previews: PreviewProvider {
    static var previews: some View {
        ShelfView()
    }
}
