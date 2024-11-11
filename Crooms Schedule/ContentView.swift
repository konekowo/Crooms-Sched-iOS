//
//  ContentView.swift
//  Crooms Schedule
//
//  Created by Suvan Mangamuri on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") private var selectedTab: Int = 0
    private var viewModel = CBSHDataViewModel()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house", value: 0) {
                HomeView()
            }
            Tab("Feed", systemImage: "newspaper", value: 2) {
                FeedView()
            }
            Tab("Daily Poll", systemImage: "questionmark.text.page", value: 1) {
                DailyPollView()
            }
        }
        .background(Color(hue: 0, saturation: 0, brightness: 0.05))
    }
    
}

#Preview {
    ContentView()
}
