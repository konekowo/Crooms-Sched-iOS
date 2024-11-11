//
//  cbsh.swift
//  Crooms Schedule
//
//  Created by Suvan Mangamuri on 11/10/24.
//

import SwiftUI
import Combine

public struct JSON_cbsh: Codable {
    let senseless: String
    let teacherquote: TeacherQuote
    let dailypoll: String
}

struct TeacherQuote: Codable {
    let quote: String
    let teacher: String
}

class CBSHDataViewModel: ObservableObject {
    @Published var data: JSON_cbsh = JSON_cbsh(senseless: "Loading...",
                                                  teacherquote: TeacherQuote(quote: "Loading...",
                                       teacher: "Loading..."),
                                                  dailypoll: "https://google.com")
    
    init() {
        fetchMessage()
    }
    
    func fetchMessage() {
        guard let url = URL(string: "https://g-chrome-dino.glitch.me/cbsh.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(JSON_cbsh.self, from: data)
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
