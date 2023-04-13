//
//  ShelfView.swift
//  Library Shelver
//
//  Created by Alistair White on 2/6/23.
//

import SwiftUI
import AVFoundation

//ShelfView displays books on a shelf that can be dragged around.
struct ShelfView: View {
    
    //let allBookInfo = Bundle.main.decode([BookInfo].self, from: "bookList.json")
    let arraySize = 7 //Used for testing, and so changing array size is easier
    let offSet : CGFloat = 7 //How far apart displayed books are
    
    @State private var player: AVAudioPlayer!
    
    @State var bookList = (0..<7).map { num in Book(info: BookInfo(id: 0, title: "Book \(num)", dewey: (Bool.random() ? Double(num) : 1.0), author: "\(num % 2 == 0 ? (Bool.random() ? "Dabbin" : "Dabage") : "Smith")"), width: CGFloat.random(in: 80...120), height: CGFloat.random(in: 250...300), horizontal: Bool.random(), barColor: Bool.random() ? .yellow : .green, color1: Bool.random() ? .blue : .cyan, color2: Bool.random() ? .blue : .cyan) } //placeholder for actual randomized book list
    @State var jBookList = [Book]()
    
    @State var currentBook = -1 //Index of the book being dragged
    @State var frontBook = -1 //Index of the book to the right of the current book
    @State var backBook = -1 //Index of book to the left of the current book
    
    @Binding var check : Bool //Are books in order
    
    @State var totalWidth : CGFloat = 0 //Total width of all books and space inbetween the books
    @State var startingPos : CGFloat = 0 //Position of the first book
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height
            VStack {
                ZStack {
                    ForEach(0..<arraySize) { i in
                        BookView(book: bookList[i]) //Displays a book with title, author, and dewy number. Book is horizontally draggable
                            .position(x: bookList[i].xPosition, y: screenHeight - (bookList[i].height / 2))
                            .zIndex(i == currentBook ? 10 : 0) //Makes sure currentBook is dislplayed ontop of all books
                            .gesture( DragGesture()
                                .onChanged { gesture in //When user is dragging on screen
                                    
                                    //Runs once, when book first starts getting dragged
                                    if currentBook < 0 {
                                        //Update index storing values
                                        currentBook = i
                                        frontBook = i + 1
                                        backBook = i - 1
                                        
                                        //Plays the sound
                                        DispatchQueue.main.asyncAfter(deadline: .now()){
                                            playSounds(sound: "click")
                                            
                                        }
                                        
                                        //Increases the dragged book size with an animation
                                        withAnimation(.linear(duration: 0.05)) {
                                            bookList[i].height += CGFloat(bookList[i].height / 15)
                                            bookList[i].width += CGFloat(bookList[i].width / 15)
                                        }
                                    }
                                    
                                    //Checks if the book is the currentBook so only one book can be dragged at a time
                                    if i == currentBook {
                                        bookList[i].xPosition = gesture.location.x //Updates the x position of the book
                                    }
                                    
                                    //Moving left
                                    if backBook >= 0 && bookList[i].xPosition - (bookList[i].width / 2) < bookList[backBook].xPosition { //Checks if the currentBook is halfway past the left book
                                        withAnimation(.linear(duration: 0.1)) {
                                            bookList[backBook].xPosition = startingPos + widthToLeft(index: backBook, includeCurrent: true) + (bookList[backBook].width / 2) //Moves the left book to where the currentBook used to be
                                        }
                                        
                                        //Update index storing values
                                        frontBook = backBook
                                        backBook -= 1
                                        
                                        //Makes sure the left book index never equals the currentBook index
                                        if backBook == currentBook {
                                            backBook -= 1
                                        }
                                    }
                                    
                                    //Moving right
                                    if frontBook < arraySize && bookList[i].xPosition + (bookList[i].width / 2) > bookList[frontBook].xPosition { //Checks if the currentBook is halfway past the right book
                                        withAnimation(.linear(duration: 0.1)) {
                                            bookList[frontBook].xPosition = startingPos +  widthToLeft(index: frontBook) + (bookList[frontBook].width / 2) //Moves the right book to where the currentBook used to be
                                        }
                                        
                                        //Update index storing values
                                        backBook = frontBook
                                        frontBook += 1
                                        
                                        //Makes sure the right book index never equals the currentBook index
                                        if frontBook == currentBook {
                                            frontBook += 1
                                        }
                                    }
                                }
                                      
                                .onEnded { _ in //When user releases touch from screen
                                    playSounds(sound: "click")
                                    //Resets the book height and width
                                    bookList[i].height -= CGFloat(bookList[i].height / 15)
                                    bookList[i].width -= CGFloat(bookList[i].width / 15)
                                    
                                    //Resets all index storing values
                                    currentBook = -1
                                    frontBook = -1
                                    backBook = -1
                                    
                                    sortByPosition()
                                    
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
                    totalWidth += offSet
                }
                totalWidth -= offSet
                startingPos = (screenWidth - totalWidth) / 2
                
                bookList.shuffle()
                sortByPosition()
                
                check = checkOrder()
            }
        }
    }
    //Makes sure array isn't already sorted by chance (maybe not needed?)
    private func fixPresortedArray() {
        if checkOrder() {
            bookList.shuffle()
            fixPresortedArray()
        }
    }
    //Checks the dewey numbers of array
    func checkOrder() -> Bool {
        //Goes through entire array of books
        for i in 1..<arraySize {
            //If the book is ever smaller than the book before it, return false
            if (bookList[i].info.dewey < bookList[i - 1].info.dewey) {
                return false
            } else if (bookList[i].info.dewey == bookList[i - 1].info.dewey){
                //check author
                if bookList[i].info.author.prefix(3).uppercased() < bookList[i - 1].info.author.prefix(3).uppercased() {
                    return false
                }
            }
        }
        return true
    }
    
    //Calculates the width to the left of book index
    private func widthToLeft(index : Int, includeCurrent : Bool = false) -> CGFloat {
        var total : CGFloat = 0
        for i in 0..<index {
            if i != currentBook {
                total += bookList[i].width + offSet
            }
        }
        if includeCurrent {
            total += bookList[currentBook].width
            total -= (bookList[currentBook].width / 15) //Current books increases size when dragged around
            total += offSet
        }
        return total
    }
    
    //First sorts the books by position, then spreads books out by correct x amount
    private func sortByPosition() {
        bookList.sort { $0.xPosition < $1.xPosition} //Sorts the books array by x position
        
        var currWidth = startingPos //Stores the width
        
        for j in 0..<arraySize {
            bookList[j].xPosition = currWidth + (bookList[j].width / 2) //Spreads out the books
            currWidth += bookList[j].width + offSet
        }
    }
    
    //Pulls random data from JSON file
    private func generateBooks()  {
        return
//        var list = [Book]()
//        for i in 0..<arraySize {
//            let bookInfo = allBookInfo[i]
//            bookList.append(Book(info: bookInfo, width: CGFloat.random(in: 80...120), height: CGFloat.random(in: 250...300), color: Bool.random() ? .yellow : .cyan))
//        }
    }
    
    private func playSounds(sound: String) {
        if let asset = NSDataAsset(name: sound){
            do {
                // Use NSDataAsset's data property to access the audio file stored in Sound.
                player = try AVAudioPlayer(data:asset.data, fileTypeHint:"wav")
                // Play the above sound file.
                player?.play()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}

struct ShelfView_Previews: PreviewProvider {
    static var previews: some View {
        ShelfView(check: .constant(false))
    }
}
