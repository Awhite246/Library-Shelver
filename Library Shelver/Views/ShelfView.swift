//
//  ShelfView.swift
//  Library Shelver
//
//  Created by Alistair White on 2/6/23.
//

import SwiftUI
import AVFoundation

struct ShelfView: View { //ShelfView displays books on a shelf that can be dragged around.
    let offSet = 110
    let arraySize = 6 //used for testing, and so changing array size is easier
    @State private var player: AVAudioPlayer!
    @State var bookList = (0...5).map { num in Book(title: "Book", dewey: Float.random(in: 0...1000), author: "\(num)", width: 100, height: CGFloat.random(in: 250...300), color: Bool.random() ? .yellow : .cyan) } //placeholder for actual randomized book list
    
    @State var currentBook = -1 //Index of the book being dragged
    @State var frontBook = -1 //Index of the book to the right of the current book
    @State var backBook = -1 //Index of book to the left of the current book
    
    @State var check = false //Are books in order
    
    @State var totalWidth : CGFloat = 0 //Total width of all books and space inbetween the books
    @State var startingPos : CGFloat = 0 //Position of the first book
    // Use this code to make sounds playSounds(sound: "")
    
    var body: some View {
        VStack {
            HStack {
                //Displays 'correct' when check == true, 'wrong' when check == false
                Text("\(check ? "Correct" : "Wrong")")
                    .foregroundColor(check ? .green : .red)
                Text("\t\(totalWidth)\t\(startingPos)")
            }
            .foregroundColor(.blue)
            .background(.black)
            ZStack {
                ForEach(0..<arraySize) { i in
                    BookView(book: bookList[i]) //Displays a book with title, author, and dewy number. Book is horizontally draggable
                        .position(x: bookList[i].xPosition, y: 300 - (bookList[i].height / 2))
                        .zIndex(i == currentBook ? 10 : 0)
                        .gesture( DragGesture()
                            .onChanged { gesture in //When user is dragging on screen
                                
                                if currentBook < 0 { //Checks if there is not a book already being dragged
                                    
                                    //Update index storing values
                                    currentBook = i
                                    frontBook = i + 1
                                    backBook = i - 1
                                    
                                    withAnimation(.linear(duration: 0.05)) { //Increases the dragged book size with an animation
                                        bookList[i].height += CGFloat(bookList[i].height / 15)
                                        bookList[i].width += CGFloat(bookList[i].width / 15)
                                    }
                                }
                                
                                if i == currentBook { //Checks if the book is the currentBook
                                    bookList[i].xPosition = gesture.location.x //Updates the x position of the book
                                }
                                
                                //Moving left
                                if backBook >= 0 && bookList[i].xPosition < (bookList[backBook].xPosition + (bookList[backBook].width / 2)) { //Checks if the currentBook is halfway past the left book
                                    withAnimation(.linear(duration: 0.05)) {
                                        bookList[backBook].xPosition = startingPos + CGFloat((backBook - 1 >= currentBook ? backBook : backBook + 1) * offSet) //Moves the left book to where the currentBook used to be
                                    }
                                    
                                    //Update index storing values
                                    frontBook = backBook
                                    backBook -= 1
                                    if backBook == currentBook { //Makes sure the left book index never equals the currentBook index
                                        backBook -= 1
                                    }
                                }
                                
                                //Moving right
                                if frontBook < arraySize && bookList[i].xPosition > (bookList[frontBook].xPosition - (bookList[frontBook].width / 2)) {
                                    //Checks if the currentBook is halfway past the right book
                                    withAnimation(.linear(duration: 0.05)) {
                                        bookList[frontBook].xPosition = startingPos + CGFloat((frontBook + 1 <= currentBook ? frontBook : frontBook - 1) * offSet) //Moves the right book to where the currentBook used to be
                                    }
                                    
                                    //Update index storing values
                                    backBook = frontBook
                                    frontBook += 1
                                    if frontBook == currentBook { //Makes sure the right book index never equals the currentBook index
                                        frontBook += 1
                                    }
                                }
                            }
                                  
                            .onEnded { _ in //When user releases touch from screen
                                
                                //Resets the book height and width
                                bookList[i].height -= CGFloat(bookList[i].height / 15)
                                bookList[i].width -= CGFloat(bookList[i].width / 15)
                                
                                //Resets all index storing values
                                currentBook = -1
                                frontBook = -1
                                backBook = -1
                                
                                sortByPosition()
                                
                                //Check if the order is correct
                                check = checkOrder()
                            }
                        )
                }
            }
        }
        .onAppear {
            //Calculates total width of all the books
            for i in 0..<arraySize {
                totalWidth += bookList[i].width
                totalWidth += 10
            }
            totalWidth -= 10
            
            //Calculates starting position from the total width
            startingPos = ( totalWidth) / 2
            //spreads books out
            sortByPosition()
        }
    }
    
    func checkOrder() -> Bool {
        //Goes through entire array of books
        for i in 1..<arraySize {
            //If the book is ever smaller than the book before it, return false
            if (bookList[i].dewey < bookList[i - 1].dewey) {
                return false
            }
        }
        return true
    }
    
    func sortByPosition() {
        //sorts the books array by book position
        bookList.sort { $0.xPosition < $1.xPosition}
        for j in 0..<6 {
            bookList[j].xPosition = startingPos + CGFloat((j * offSet)) //Spreads out the books
        }
    }
}

struct ShelfView_Previews: PreviewProvider {
    static var previews: some View {
        ShelfView()
    }
}
