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
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
 */
// https://www.tutorialspoint.com/reading-a-json-file-using-swift
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


    // here is link for top json https://stackoverflow.com/questions/73939302/can-i-use-a-string-in-a-json-file-to-access-a-swift-view-from-within-another-vie

// additional link incase if first link doesnt work in  our code. https://www.hackingwithswift.com/forums/swiftui/is-it-possible-to-use-a-variable-string-to-read-a-json-file/20244/20251
