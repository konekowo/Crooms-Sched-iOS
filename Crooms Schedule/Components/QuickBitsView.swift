//
//  LunchView.swift
//  Crooms Schedule
//
//  Created by Suvan Mangamuri on 11/10/24.
//

import SwiftUI

struct QuickBitsView: View {
    @StateObject private var viewModel = InfoFetchViewModel()
    var body: some View {
        VStack {
            Text("Quick Bits")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            ForEach(viewModel.data.quickBits.indices, id: \.self) { index in
                    Text("\(index + 1). \(viewModel.data.quickBits[index])")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
            }
            
        }
    }
}

#Preview {
    //ScrollView {
        QuickBitsView()
            .modifier(GroupMod())
    //}
}
