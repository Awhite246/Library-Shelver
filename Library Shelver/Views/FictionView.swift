//
//  FictionView.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 2/15/23.
//

import SwiftUI

struct FictionView: View {
    @State var bookList = (0...5).map { num in Book(title: "Book", dewey: 1, author: "\(num)", xPosition: (50 + CGFloat(num * 55))) }
    @State var position = 0.0
    @State var currentBook = -1 //keeps track of which book is being dragged, so more than one book can't be dragged at once
    @State var frontBook = -1 //keeps track of book infront of current book
    @State var backBook = -1 //keeps track of book behind of current book
    
    let arraySize = 6
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 500)
            Text("Fiction Sorter")
                .foregroundColor(Color.yellow)
                .fontWeight(.bold)
                .font(.title)
                Spacer()
                .frame(height: 300)
            VStack {
                Text("\(position)")
                Text("Current: \(currentBook)\tBack:\(backBook)\tFront:\(frontBook)")
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
                                                frontBook = i + 1
                                                backBook = i - 1
                                                bookList[i].height += 10
                                                bookList[i].width += 5
                                            }
                                            if i == currentBook { //makes sure only the current book can be dragged
                                                //moves the book your dragging
                                                bookList[i].xPosition = gesture.location.x
                                            }
                                            //Dynamicly change other book positions, parting the waters
                                            
                                            if backBook >= 0 && bookList[i].xPosition < (bookList[backBook].xPosition + (bookList[backBook].width / 2)) { //checking moving left, when position is less than the book behind
                                                bookList[backBook].xPosition = CGFloat(50 + ((backBook + 1) * 55))
                                                frontBook = backBook
                                                backBook -= 1
                                            }
                                            if frontBook < arraySize && bookList[i].xPosition > (bookList[frontBook].xPosition - (bookList[frontBook].width / 2)) {
                                                //checking moving right, when position is greater than book ahead
                                                bookList[frontBook].xPosition = CGFloat(50 + ((frontBook - 1) * 55))
                                                backBook = frontBook
                                                frontBook += 1
                                            }
                                            
                                            position = bookList[i].xPosition
                                        }
                                        //update 'start' position of books on release
                                        .onEnded { _ in
                                            //resets current book so a new book can be dragged
                                            bookList[i].height -= 10
                                            bookList[i].width -= 5
                                            currentBook = -1
                                            frontBook = -1
                                            backBook = -1
                                            //sorts the books by position, then spreads them out
                                            bookList.sort { $0.xPosition < $1.xPosition}
                                            for j in 0..<6 {
                                                bookList[j].xPosition = CGFloat(50 + (j * 55))
                                            }
                                        }
                                )
                        }
                    }
                    .offset(y: 100)
                }
            }
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

struct FictionView_Previews: PreviewProvider {
    static var previews: some View {
        FictionView()
    }
}
