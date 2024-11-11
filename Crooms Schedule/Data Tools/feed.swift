
//
//  feed.swift
//  Crooms Schedule
//
//  Created by Suvan Mangamuri on 11/10/24.
//

import SwiftUI
import Combine

public struct JSON_Feed: Codable {
    var status: String = "Loading"
    var data: [FeedItem] = []
}

struct FeedItem: Codable {
    let data: String
    let store: String
    let id: String
    let create: String
    let delete: String
}

class FeedViewModel: ObservableObject {
    @Published var data: JSON_Feed = JSON_Feed()
    
    init() {
        fetchMessage()
    }
    
    func fetchMessage() {
        guard let url = URL(string: "https://api.croomssched.tech/feed") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(JSON_Feed.self, from: data)
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
