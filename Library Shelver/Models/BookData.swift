//
//  BookData.swift
//  Library Shelver
//
//  Created by Alistair White on 4/4/23.
// https://github.com/scipio1516/DeweyDecimalGame/blob/dev/DeweyDecimalGame/Data/BookDatabase.swift

import Foundation
import SwiftUI

var colorList : [Color] = [
    Color(red: 251, green: 80, blue: 18), //Tangelo
    Color(red: 1, green: 253, blue: 246), //Fluorescent cyan
    Color(red: 203, green: 186, blue: 237), //Periwinkle
    Color(red: 233, green: 233, blue: 0), //Aureolin
    Color(red: 3, green: 252, blue: 186), //Aquamarine
    Color(red: 42, green: 157, blue: 143), //Persian green
    Color(red: 233, green: 196, blue: 106), //Saffron
    Color(red: 244, green: 162, blue: 97), //Sandy Brown
    Color(red: 231, green: 111, blue: 81), //Burnt sienna
    Color(red: 34, green: 116, blue: 165), //UCLA Blue
    Color(red: 247, green: 92, blue: 3), //Orange (Pantone)
    Color(red: 241, green: 196, blue: 15), //Jonquil
    Color(red: 217, green: 3, blue: 104), //Dogwood rose
    Color(red: 0, green: 204, blue: 102), //Emerald
    Color(red: 253, green: 197, blue: 245), //Pink lavender
    Color(red: 247, green: 174, blue: 248), //Plum (web)
    Color(red: 179, green: 136, blue: 235), //Lavender (floral)
    Color(red: 128, green: 147, blue: 241), //Vista Blue
    Color(red: 114, green: 221, blue: 247) //Sky blue
]

/*
 Personal links for me so i can try to figure out colors/text cut off
 https://stackoverflow.com/questions/60184145/swiftui-modifier-inside-array
 https://www.hackingwithswift.com/forums/swiftui/text-cutting-subscript-character/6672
 */

var deweyData : [BookInfo] = [
    BookInfo(id: 0, title: "Wizard Book", dewey: 069.32, author: "Sussman"),
    BookInfo(id: 1, title: "Behind the Door", dewey: 083.92, author: "Gonzales"),
    BookInfo(id: 2, title: "Innocent Eyes", dewey: 098.54, author: "Spade"),
    BookInfo(id: 3, title: "Bad Surprise", dewey: 204.29, author: "Finch"),
    BookInfo(id: 4, title: "Blank Paper", dewey: 043.86, author: "Beam"),
    BookInfo(id: 5, title: "The Perfect Thief", dewey: 146.39, author: "Driscoll"),
    BookInfo(id: 6, title: "Time To Go", dewey: 123.17, author: "Hendrix"),
    BookInfo(id: 7, title: "Long Road To Go", dewey: 082.72, author: "Zimmerman"),
    BookInfo(id: 8, title: "Judge of Crime", dewey: 028.28, author: "Verlice"),
    BookInfo(id: 9, title: "A Sharp Punishment", dewey: 146.58, author: "Jenkins"),
    BookInfo(id: 10, title: "Fear Of Those", dewey: 138.72, author: "Keller"),
    BookInfo(id: 11, title: "Elite of the Unkowns", dewey: 109.54, author: "Ellis"),
    BookInfo(id: 12, title: "One Shot", dewey: 093.94, author: "Hope"),
    BookInfo(id: 13, title: "We Are Powerful", dewey: 168.92, author: "Cassidy"),
    BookInfo(id: 14, title: "Lone Cowboy", dewey: 184.88, author: "West"),
    BookInfo(id: 15, title: "Cursed Queen", dewey: 015.55, author: "Levine"),
    BookInfo(id: 16, title: "Butterflies in Your Backyard", dewey: 595.78, author: "Vibbert"),
    BookInfo(id: 17, title: "Countries of the World: Chile", dewey: 983, author: "Francisco"),
    BookInfo(id: 18, title: "Countries of the World: Ghana", dewey: 966.7, author: "Francisco"),
    BookInfo(id: 19, title: "Countries of the World: Japan", dewey: 952, author: "Francisco"),
    BookInfo(id: 20, title: "A Cat's Life", dewey: 636.8, author: "Lightfoot"),
    BookInfo(id: 21, title: "Create a Simple Machine", dewey: 621.8, author: "Crook"),
    BookInfo(id: 22, title: "Great Greek Myths", dewey: 292, author: "Ross"),
    BookInfo(id: 23, title: "Cake Decorating", dewey: 641.86, author: "Adams")
]

var fictionData : [BookInfo] = [
    BookInfo(id: 0, title: "Ms. B's Book Club", dewey: -1, author: "Karam"),
    BookInfo(id: 1, title: "Gona Fishing", dewey: -1, author: "Francis"),
    BookInfo(id: 2, title: "The Mad Scientist", dewey: -1, author: "Turner"),
    BookInfo(id: 3, title: "Superhero Book", dewey: -1, author: "Lundquist"),
    BookInfo(id: 4, title: "When Pigs Fly", dewey: -1, author: "West"),
    BookInfo(id: 5, title: "Sunshine Fairies", dewey: -1, author: "Carrell"),
    BookInfo(id: 6, title: "The Red Queen", dewey: -1, author: "Gardner"),
    BookInfo(id: 7, title: "A Magic Wand", dewey: -1, author: "Patel"),
    BookInfo(id: 2, title: "Superhero Book", dewey: -1, author: "Lundquist"),
]
    /*
    Book(bookTitle: "Wizard Book", bookColor: greenColor, authorName: "H. Abelson & G. Sussman", callID: "ABE", deweyDecimalNumber: 069.32), // 1
    Book(bookTitle: "Behind the Door", bookColor: greenColor, authorName: "Xavier Gonzales", callID: "GON", deweyDecimalNumber: 083.92), // 2
    Book(bookTitle: "Innocent Eyes", bookColor: greenColor, authorName: "Gael Spade", callID: "SPA", deweyDecimalNumber: 098.54), // 3
    Book(bookTitle: "Bad Surprise", bookColor: redColor, authorName: "Dominic Finch", callID: "FIN", deweyDecimalNumber: 204.29), // 4
    Book(bookTitle: "Blank Paper", bookColor: redColor, authorName: "Declan Beam", callID: "BEA", deweyDecimalNumber: 043.86), // 5
    Book(bookTitle: "The Perfect Thief", bookColor: redColor, authorName: "Austin Driscoll", callID: "DRI", deweyDecimalNumber: 146.39), // 6
    Book(bookTitle: "Time To Go", bookColor: extraColor, authorName: "Jace Hendrix", callID: "HEN", deweyDecimalNumber: 123.17), // 7
    Book(bookTitle: "Long Road To Go", bookColor: extraColor, authorName: "Gael Zimmerman", callID: "ZIM", deweyDecimalNumber: 082.72), // 8
    Book(bookTitle: "Judge of Crime", bookColor: extraColor, authorName: "Connor Verlice", callID: "VER", deweyDecimalNumber: 028.28), // 9
    Book(bookTitle: "A Sharp Punishment", bookColor: pureBlueColor, authorName: "Nicholas Jenkins", callID: "JEN", deweyDecimalNumber: 146.58), // 10
    Book(bookTitle: "Fear Of Those", bookColor: pureBlueColor, authorName: "Emmett Keller", callID: "KEL", deweyDecimalNumber: 138.72), // 11
    Book(bookTitle: "Elite of the Unknowns", bookColor: pureBlueColor, authorName: "Jose Ellis", callID: "ELL", deweyDecimalNumber: 109.54), // 12
    Book(bookTitle: "One Shot", bookColor: orangeColor, authorName: "Ryder Hope", callID: "HOP", deweyDecimalNumber: 093.94), // 13
    Book(bookTitle: "We Are Powerful", bookColor: orangeColor, authorName: "Rowan Cassidy", callID: "CAS", deweyDecimalNumber: 168.82), // 14
    Book(bookTitle: "Lone Cowboy", bookColor: orangeColor, authorName: "Parker West", callID: "WES", deweyDecimalNumber: 184.88), // 15
    Book(bookTitle: "Cursed Queen", bookColor: purpleColor, authorName: "Diego Levine", callID: "LEV", deweyDecimalNumber: 015.55), // 16
    Book(bookTitle: "The Blue Knight", bookColor: purpleColor, authorName: "Brayden Thatcher", callID: "THA", deweyDecimalNumber: 156.78), // 17
    Book(bookTitle: "Fire And Water", bookColor: purpleColor, authorName: "Zion Raven", callID: "RAV", deweyDecimalNumber: 037.64), // 18
    Book(bookTitle: "Burger Boy", bookColor: turquoiseColor, authorName: "Archer Monroe", callID: "MON", deweyDecimalNumber: 082.92), // 19
    Book(bookTitle: "Galaxy Bugs", bookColor: turquoiseColor, authorName: "Theo Elsher", callID: "ELS", deweyDecimalNumber: 049.76), // 20
    */

    /*
    Book(bookTitle: "Ms. B's Book Club", bookColor: greenColor, authorName: "Amy Karam", callID: "KAR", deweyDecimalNumber: 0), // 1
    Book(bookTitle: "The Reading Place", bookColor: greenColor, authorName: "Benoit Reed", callID: "REE", deweyDecimalNumber: 0), // 2
    Book(bookTitle: "Gone Fishing", bookColor: greenColor, authorName: "Charlie Francis", callID: "FRA", deweyDecimalNumber: 0), // 3
    Book(bookTitle: "The Underlings", bookColor: redColor, authorName: "Diana Vander", callID: "VAN", deweyDecimalNumber: 0), // 4
    Book(bookTitle: "The Mad Scientist", bookColor: redColor, authorName: "Emma Turner", callID: "TUR", deweyDecimalNumber: 0), // 5
    Book(bookTitle: "The Tunnel", bookColor: redColor, authorName: "Fal Tetreault", callID: "TET", deweyDecimalNumber: 0), // 6
    Book(bookTitle: "World Travel Tales", bookColor: pureBlueColor, authorName: "Sam Swerling", callID: "SWE", deweyDecimalNumber: 0), // 7
    Book(bookTitle: "Jack the Guide Dog", bookColor: pureBlueColor, authorName: "Owen Wilson", callID: "WIL", deweyDecimalNumber: 0), // 8
    Book(bookTitle: "The Open Room", bookColor: pureBlueColor, authorName: "James Stoll", callID: "STO", deweyDecimalNumber: 0), // 9
    Book(bookTitle: "The Magic Tree", bookColor: orangeColor, authorName: "Noah Ledger", callID: "LED", deweyDecimalNumber: 0), // 10
    Book(bookTitle: "A Spell Too Far", bookColor: orangeColor, authorName: "Liam Collymore", callID: "COL", deweyDecimalNumber: 0), // 11
    Book(bookTitle: "Tower To The Stars", bookColor: orangeColor, authorName: "Levi Verlice", callID: "VER", deweyDecimalNumber: 0), // 12
    Book(bookTitle: "A Potion For The Wise", bookColor: purpleColor, authorName: "Theodore Ledger", callID: "LED", deweyDecimalNumber: 0), // 13
    Book(bookTitle: "The Enchanted Ones", bookColor: purpleColor, authorName: "Michael Beckett", callID: "BEC", deweyDecimalNumber: 0), // 14
    Book(bookTitle: "Winter Fairy", bookColor: purpleColor, authorName: "Logan Adler", callID: "ADL", deweyDecimalNumber: 0), // 15
    Book(bookTitle: "The Dark Dragon", bookColor: extraColor, authorName: "Ethan Hayes", callID: "HAY", deweyDecimalNumber: 0), // 16
    Book(bookTitle: "Lost Warriors Of Elysium", bookColor: extraColor, authorName: "Charles Wilson", callID: "WIL", deweyDecimalNumber: 0), // 17
    Book(bookTitle: "The Hollow Spirit", bookColor: extraColor, authorName: "Jaxon Gray", callID: "GRA", deweyDecimalNumber: 0), // 18
    Book(bookTitle: "Eye of the Wolf", bookColor: turquoiseColor, authorName: "Nolan Anderson", callID: "AND", deweyDecimalNumber: 0), // 19
    Book(bookTitle: "Love of Tomorrow", bookColor: turquoiseColor, authorName: "Miles Curran", callID: "CUR", deweyDecimalNumber: 0), // 20
    Book(bookTitle: "Rain On Those", bookColor: turquoiseColor, authorName: "Cameron Gasper", callID: "GAS", deweyDecimalNumber: 0), // 21
    */
