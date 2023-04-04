//
//  JSONreader.swift
//  Library Shelver
//
//  Created by Alistair White on 3/14/23.
//

import SwiftUI
import Foundation
import UIKit

/*var books: [BookInfo] = load("booksData.json")

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
 */
func readJSONFile(forName name: String) {
    do {
        if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
           let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            if let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as? [String: Any] {
                print("JSON: \(json)")
            } else {
                print("Given JSON is not a valid dictionary object.")
            }
        }
    } catch {
        print(error)
    }
}


    // here is link for this https://stackoverflow.com/questions/73939302/can-i-use-a-string-in-a-json-file-to-access-a-swift-view-from-within-another-vie

// additional link incase if first link doesnt work in  our code. https://www.hackingwithswift.com/forums/swiftui/is-it-possible-to-use-a-variable-string-to-read-a-json-file/20244/20251
