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
    @State var shouldNavigate = false
    @ObservedObject var viewModel: ViewModel
    var topOffersViewModel = TopOffersViewModel(activeNavigation: MainAppRouter())
    var oneColumns = [GridItem()]
    var body: some View {
        NavigationView {
        ScrollView {
            LazyVGrid(columns: oneColumns) {
                Text(viewModel.viewModel ?? "")
                TopOffersView(viewModel: topOffersViewModel)
                EditorialView()
                CustomButton(title: "Hooooo") {
                    shouldNavigate = true
                }
                NavigationLink("Title") {
                    EmptyView()
                }
                NavigationLink(isActive: $shouldNavigate) {
                    viewModel.navigate()
                } label: {
                    EmptyView()
                }

            }.padding()
        }
        .navigationBarTitle("", displayMode: .inline)
//        .navigationBarHidden(true)

    }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)){
            Text("tw").searchCompletion("two")
        }
    }
}
