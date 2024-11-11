//
//  HomeView.swift
//  Crooms Schedule
//
//  Created by Suvan Mangamuri on 11/10/24.
//

import SwiftUI
import WebKit

struct DailyPollView: View {
    @StateObject private var viewModel = CBSHDataViewModel()
    
    var body: some View {
        WebView(url: URL(string: viewModel.data.dailypoll)!)
                    .edgesIgnoringSafeArea(.all)
    }
    
}

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

#Preview {
    ContentView()
}
