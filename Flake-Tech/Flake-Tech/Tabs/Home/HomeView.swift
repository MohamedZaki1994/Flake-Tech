//
//  HomeView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 21/02/2022.
//

import SwiftUI
import Components

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @State var searchText: String = ""
    @ObservedObject var viewModel: ViewModel
    var oneColumns = [GridItem()]
    var body: some View {
        NavigationView {
        ScrollView {
            LazyVGrid(columns: oneColumns) {
                Text(viewModel.viewModel ?? "")
                TopOffersView()
                EditorialView()
                CustomButton(title: "Hooooo") {
                    print("click")
                }
                NavigationLink("Title") {
                    Text("d")
                }
            }.padding()
        }
    }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)){
            Text("tw").searchCompletion("two")
        }
    }
}
