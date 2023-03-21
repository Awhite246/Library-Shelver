//
//  JSONreader.swift
//  Library Shelver
//
//  Created by Alistair White on 3/14/23.
//

import SwiftUI
import Foundation
import UIKit

var books: [BookInfo] = load("booksData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

    // here is link for this https://stackoverflow.com/questions/73939302/can-i-use-a-string-in-a-json-file-to-access-a-swift-view-from-within-another-vie
