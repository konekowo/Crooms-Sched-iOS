//
//  HomeView.swift
//  Crooms Schedule
//
//  Created by Suvan Mangamuri on 11/10/24.
//

import SwiftUI
import WebKit

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    @State private var showingFeedUpdate = false
    @State private var feedUpdate = ""
    @State private var feedLink = ""

    var body: some View {
        HStack {
            Text("Feed")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            Button("Add Feed Update") {
                showingFeedUpdate = true
            }
            .padding()
            .alert("Feed Update", isPresented: $showingFeedUpdate) {
                TextField("Feed Update", text: $feedUpdate)
                TextField("Link (optional)", text: $feedLink)
                Button("Ok", action: sendFeedUpdate)
                Button("Cancel", role: .cancel) {}
            }
        }
        WebFeedView(feedItems: $viewModel.data.data)
    }
    
    func sendFeedUpdate() {
        var data = "";
        if (!feedLink.isEmpty) {
            data = "<a target=CBSHfeed href=\(feedLink)>\(feedUpdate)</a>"
        } else {
            data = feedUpdate
        }
        
        guard let url = URL(string: "https://api.croomssched.tech/feed") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Create the JSON body
        let jsonBody = ["data": data]
        request.httpBody = try? JSONSerialization.data(withJSONObject: jsonBody)

        // Send the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error:", error)
                return
            }
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("Response:", responseString)
                viewModel.fetchMessage()
            }
        }
        .resume()
    }
    
}

struct WebFeedView: UIViewRepresentable {
    @Environment(\.self) var environment
    @Binding var feedItems: [FeedItem]
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        var body = ""
        feedItems.forEach { feedItem in
            body += "<div class='feedItem'>\(feedItem.data)</div>"
        }
        
        
        let color = Color.accent.resolve(in: environment)
        let htmlColor = "rgb(\(round(color.red * 255)), \(round(color.green * 255)), \(round(color.blue * 255)))"
        
        
        uiView.loadHTMLString(
            """
            <!DOCTYPE html>
            <html>
                <head> 
                    <style>
                        :root {
                            --accent: \(htmlColor);
                        }
                        body {
                            font-size: 2.5rem;
                            font-family: -apple-system;
                            padding-left: 2.5rem;
                            padding-right: 2.5rem;
                            overflow-x: hidden;
                            overflow-y: auto;
                        }
                        @media (prefers-color-scheme: dark) {
                            body {
                                background-color: black;
                                color: white;
                            }
                            .feedItem {
                                background-color: #1c1c1e;
                            }
                        }
                        @media (prefers-color-scheme: light) {
                            body {
                                background-color: white;
                                color: black;
                            }
                            .feedItem {
                                background-color: #f2f2f7;
                            }
                        }
                        .feedItem {
                            margin-bottom: 1rem;
                            padding: 2.5rem;
                            border-radius: 14px;
                            overflow: auto;
                        }
                        a {
                            color: var(--accent);
                        }
                        .rainbow, rainbow {
                            animation: anim-rainbow 5s infinite;
                        }

                        @keyframes anim-rainbow {
                            0% {
                                color: hsla(0deg 100% 50%);
                            }
                            16.67% {
                                color: hsla(60deg 100% 50%);
                            }
                            33.33% {
                                color: hsla(120deg 100% 50%);
                            }
                            50% {
                                color: hsla(180deg 100% 50%);
                            }
                            66.67% {
                                color: hsla(240deg 100% 50%);
                            }
                            83.33% {
                                color: hsla(300deg 100% 50%);
                            }
                            100% {
                                color: hsla(360deg 100% 50%);
                            }
                        }

                        @keyframes bkg-rainbow {
                            0% {
                                background-color: hsla(0deg 100% 50%);
                            }
                            16.67% {
                                background-color: hsla(60deg 100% 50%);
                            }
                            33.33% {
                                background-color: hsla(120deg 100% 50%);
                            }
                            50% {
                                background-color: hsla(180deg 100% 50%);
                            }
                            66.67% {
                                background-color: hsla(240deg 100% 50%);
                            }
                            83.33% {
                                background-color: hsla(300deg 100% 50%);
                            }
                            100% {
                                background-color: hsla(360deg 100% 50%);
                            }
                        }
                        .urgent {
                            animation: urgent-fade 2s infinite;
                        }

                        .important {
                            animation: important-fade 5s infinite;
                        }

                        @keyframes urgent-fade {
                            0% {
                                color: unset;
                            }
                            50% {
                                color: #FF1010;
                            }
                            100% {
                                color: unset;
                            }
                        }

                        @keyframes important-fade {
                            0% {
                                color: unset;
                            }
                            50% {
                                color: darkorange;
                            }
                            100% {
                                color: unset;
                            }
                        }
                    </style>
                </head> 
                <body>
                    \(body)
                </body>
            </html>
            """
            , baseURL: nil)
    }
}

#Preview {
    ContentView()
}
