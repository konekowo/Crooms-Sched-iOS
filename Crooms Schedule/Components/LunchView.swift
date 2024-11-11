//
//  LunchView.swift
//  Crooms Schedule
//
//  Created by Suvan Mangamuri on 11/10/24.
//

import SwiftUI

struct LunchView: View {
    @StateObject private var viewModel = InfoFetchViewModel()
    var body: some View {
        VStack {
            Text("What's for lunch?")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            VStack {
                VStack {
                    HStack {
                        Text("Monday")
                            .padding()
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue, lineWidth: 1)
                            )
                        Text(viewModel.data.lunch.key1.name)
                        Spacer()
                    }
                    AsyncImage(url: URL(string: viewModel.data.lunch.key1.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 195)
                    .frame(height: 150)
                    .clipShape(.rect(cornerRadius: 10))
                }
                VStack {
                    HStack {
                        Text("Tuesday")
                            .padding()
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue, lineWidth: 1)
                            )
                        Text(viewModel.data.lunch.key2.name)
                        Spacer()
                    }
                    AsyncImage(url: URL(string: viewModel.data.lunch.key2.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 350)
                    .frame(height: 150)
                    .clipShape(.rect(cornerRadius: 10))
                }
                VStack {
                    HStack {
                        Text("Wednesday")
                            .padding()
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue, lineWidth: 1)
                            )
                        Text(viewModel.data.lunch.key3.name)
                        Spacer()
                    }
                    AsyncImage(url: URL(string: viewModel.data.lunch.key3.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 500)
                    .frame(height: 150)
                    .clipShape(.rect(cornerRadius: 10))
                }
                VStack {
                    HStack {
                        Text("Thursday")
                            .padding()
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue, lineWidth: 1)
                            )
                        Text(viewModel.data.lunch.key4.name)
                        Spacer()
                    }
                    AsyncImage(url: URL(string: viewModel.data.lunch.key4.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 225)
                    .frame(height: 150)
                    .clipShape(.rect(cornerRadius: 10))
                }
                VStack {
                    HStack {
                        Text("Friday")
                            .padding()
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue, lineWidth: 1)
                            )
                        Text(viewModel.data.lunch.key5.name)
                        Spacer()
                    }
                    AsyncImage(url: URL(string: viewModel.data.lunch.key5.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 325)
                    .frame(height: 150)
                    .clipShape(.rect(cornerRadius: 10))
                }
                VStack {
                    HStack {
                        Text("Every Day")
                            .padding()
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue, lineWidth: 1)
                            )
                        Text(viewModel.data.lunch.key6.replacingOccurrences(of: "<br>", with: ", "))
                        Spacer()
                    }
                }
            }
            .frame(alignment: .top)
        }
    }
}

#Preview {
    ScrollView {
        LunchView()
            .modifier(GroupMod())
    }
}
