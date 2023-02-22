//
//  ShelfView.swift
//  Library Shelver
//
//  Created by Alistair White on 2/6/23.
//

import SwiftUI

//displays books and allows dragging around for reordering
struct ShelfView: View {
    let offSet = 110
    //placeholder for actual randomized book list
    @State var bookList = (0...5).map { num in Book(title: "Book", dewey: Float.random(in: 0...1000), author: "\(num)", xPosition: (80 + CGFloat(num * 110))) }
    @State var position = 0.0
    @State var currentBook = -1 //keeps track of which book is being dragged, so more than one book can't be dragged at once
    @State var frontBook = -1 //keeps track of book infront of current book
    @State var backBook = -1 //keeps track of book behind of current book
    @State var check = false //used to keep of if books are in order
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
            HStack {
                //Text("\(position)")
                Button("Check") {
                    for i in 1..<arraySize {
                        if !(bookList[i].dewey > bookList[i - 1].dewey) {
                            check = false
                            return
                        }
                        check = true
                    }
                }
                Text(": \(check ? "Correct" : "Wrong")")
                    .foregroundColor(check ? .green : .red)
            }
            .foregroundColor(.blue)
            .background(.black)
            //Text("Current: \(currentBook)\tBack:\(backBook)\tFront:\(frontBook)")
            ZStack {
                Group {
                    ForEach(0..<arraySize) { i in
                        //Displays a book with title, author, and dewy number. Book is horizontally draggable
                        BookView(book: bookList[i])
                            .position(x: bookList[i].xPosition)
                            .zIndex(i == currentBook ? 10 : 0)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        //checks if there is a current book or not
                                        if currentBook < 0 {
                                            currentBook = i
                                            frontBook = i + 1
                                            backBook = i - 1
                                            
                                            //makes the book your dragging bigger so it is easier for the user to tell what is happening
                                            withAnimation(.linear(duration: 0.05)) {
                                                bookList[i].height += CGFloat(bookList[i].height / 15)
                                                bookList[i].width += CGFloat(bookList[i].width / 15)
                                            }
                                        }
                                        if i == currentBook { //makes sure only the current book can be dragged
                                            //moves the book your dragging
                                            bookList[i].xPosition = gesture.location.x
                                        }
                                        //Dynamicly change other book positions, parting the waters
                                        if backBook >= 0 && bookList[i].xPosition < (bookList[backBook].xPosition + (bookList[backBook].width / 2)) { //checking moving left, when the position of the dragged book is halfway past the book behind.
                                            withAnimation(.linear(duration: 0.05)) {
                                                bookList[backBook].xPosition = CGFloat(80 + ((backBook - 1 >= currentBook ? backBook : backBook + 1) * offSet))
                                            }
                                            frontBook = backBook
                                            backBook -= 1
                                            if backBook == currentBook { //stops book glitch
                                                backBook -= 1
                                            }
                                        }
                                        if frontBook < arraySize && bookList[i].xPosition > (bookList[frontBook].xPosition - (bookList[frontBook].width / 2)) {
                                            //checking moving right, when position of the dragged book is halfway past the book ahead
                                            withAnimation(.linear(duration: 0.05)) {
                                                bookList[frontBook].xPosition = CGFloat(80 + ((frontBook + 1 <= currentBook ? frontBook : frontBook - 1) * offSet))
                                            }
                                            backBook = frontBook
                                            frontBook += 1
                                            if frontBook == currentBook {
                                                frontBook += 1
                                            }
                                        }
                                        
                                        position = bookList[i].xPosition
                                    }
                                    //update 'start' position of books on release
                                    .onEnded { _ in
                                        //resets current book so a new book can be dragged
                                        
                                            bookList[i].height -= CGFloat(bookList[i].height / 15)
                                            bookList[i].width -= CGFloat(bookList[i].width / 15)
                                        currentBook = -1
                                        frontBook = -1
                                        backBook = -1
                                        //sorts the books by position, then spreads them out
                                            bookList.sort { $0.xPosition < $1.xPosition}
                                            for j in 0..<6 {
                                                bookList[j].xPosition = CGFloat(80 + (j * offSet))
                                            }
                                    }
                            )
                    }
                }
                .offset(y: 150)
            }
        }
    }
}

struct ShelfView_Previews: PreviewProvider {
    static var previews: some View {
        ShelfView()
    }
}
