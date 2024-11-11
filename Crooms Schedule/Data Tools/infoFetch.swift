//
//  infoFetch.swift
//  Crooms Schedule
//
//  Created by Suvan Mangamuri on 11/10/24.
//

import SwiftUI
import Combine

public struct JSON_infoFetch: Codable {
    var lunch: LunchStucture = LunchStucture()
    var quickBits: [String] = ["Loading..."]
}

struct LunchStucture: Codable {
    var key1: LunchItem = LunchItem(name: "Loading...", image: "")
    var key2: LunchItem = LunchItem(name: "Loading...", image: "")
    var key3: LunchItem = LunchItem(name: "Loading...", image: "")
    var key4: LunchItem = LunchItem(name: "Loading...", image: "")
    var key5: LunchItem = LunchItem(name: "Loading...", image: "")
    var key6: String = "Loading..."
    
    enum CodingKeys: String, CodingKey {
        case key1 = "1"
        case key2 = "2"
        case key3 = "3"
        case key4 = "4"
        case key5 = "5"
        case key6 = "6"
    }
}

struct LunchItem: Codable {
    let name: String
    let image: String
}

class InfoFetchViewModel: ObservableObject {
    @Published var data: JSON_infoFetch = JSON_infoFetch()
    
    init() {
        fetchMessage()
    }
    
    func fetchMessage() {
        guard let url = URL(string: "https://croomssched.glitch.me/infoFetch.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(JSON_infoFetch.self, from: data)
                    DispatchQueue.main.async {
                        self.data = decodedData
                    }
                } catch {
                    print("Error decoding JSON:", error)
                }
            } else if let error = error {
                print("Error fetching data:", error)
            }
        }.resume()
    }
}
