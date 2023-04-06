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
    BookInfo(id: 8, title: "The Last Dragon Rider", dewey: -1, author: "Hawthorne"),
    BookInfo(id: 9, title: "Enchantress's Curse", dewey: -1, author: "Stone"),
    BookInfo(id: 10, title: "War of the Worlds", dewey: -1, author: "Wells"),
    BookInfo(id: 11, title: "Ghost of Graystone Manor", dewey: -1, author: "Greene"),
    BookInfo(id: 12, title: "Island of Dr. Moreau", dewey: -1, author: "Wells"),
    BookInfo(id: 13, title: "Sherlock Holmes Mystery", dewey: -1, author: "Mitchell"),
    BookInfo(id: 14, title: "Flying Dolphins with Lazers", dewey: -1, author: "Dantes"),
    BookInfo(id: 15, title: "The Burnt Toast that Could", dewey: -1, author: "Backwood"),
    BookInfo(id: 16, title: "Gandolf Becomes a Farmer", dewey: -1, author: "Hyde"),
    BookInfo(id: 17, title: "Spooky Ghosts at Spooky Town", dewey: -1, author: "Irving"),
    BookInfo(id: 18, title: "The Stone King", dewey: -1, author: "Grayson"),
    BookInfo(id: 19, title: "Batman goes on Vacation", dewey: -1, author: "Wilde"),
    BookInfo(id: 20, title: "Super Secret Mission 5", dewey: -1, author: "Tate"),
    BookInfo(id: 21, title: "Super Secret Mission 3", dewey: -1, author: "Tate"),
    BookInfo(id: 22, title: "The Invisible Man", dewey: -1, author: "Fenton"),
    BookInfo(id: 23, title: "Ghost Hunter's Diary", dewey: -1, author: "Quinn")
]

var tryAgainMessages : [String] = [
    "Don't give up, you got this!",
    "You can do this, try again!",
    "Try again, you'll get it right!",
    "Every effort counts, keep going!",
    "You got this, you're getting closer!",
    "Keep trying, you'll get it!",
    "Don't give up, try again!",
    "You're so close, keep going!",
    "Try again, you can do it!",
    "Try again, you'll get there!",
    "Don't lose hope, try again!",
    "Believe in yourself, try again!",
    "Never give up, try again!",
    "Don't give up, try once more!",
    "You're improving, try again!"
]
