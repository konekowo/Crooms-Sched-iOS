//
//  HomeView.swift
//  Crooms Schedule
//
//  Created by Suvan Mangamuri on 11/10/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = CBSHDataViewModel()
    
    var body: some View {
        ScrollView {
            Text("Home")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            Group {
                VStack {
                    Text("Today's random and senseless quip is... ")
                    Text("\"" + viewModel.data.senseless + "\"")
                        .italic()
                }
                LunchView()
                QuickBitsView()
                VStack {
                    Text("This week's teacher quote is... ")
                    Text("\"" + viewModel.data.teacherquote.quote + "\"" + " - " + viewModel.data.teacherquote.teacher)
                        .italic()
                }
            }
            .modifier(GroupMod())
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
}

struct GroupMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadius(7)
            .padding(.horizontal, 20)
    }
}

#Preview {
    ContentView(defaultSelection: 0)
}
