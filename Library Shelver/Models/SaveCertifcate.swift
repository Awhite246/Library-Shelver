//
//  SavaCertifcate.swift
//  Library Shelver
//
//  Created by Alistair White on 3/23/23.
//

import Foundation

class CertificateList : ObservableObject {
    @Published var certifcates : [Certificate] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(certifcates) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Certificate].self, from: items) {
                self.certifcates = decoded
                return
            }
        }
        certifcates = []
    }
}

struct Certificate : Identifiable, Codable {
    var id = UUID()
    var attempts : Int
    var name : String
    var time : Date
    var type : String
}
