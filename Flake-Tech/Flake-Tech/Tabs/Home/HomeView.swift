//
//  HomeView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 21/02/2022.
//

import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @State var searchText: String = ""
    @State var shouldNavigate = false
    @ObservedObject var viewModel: ViewModel
    var topOffersViewModel = TopOffersComponentViewModel(activeNavigation: MainAppRouter())
    var recommendedViewMdel = RecommendedViewModel(route: MainAppRouter())
    var oneColumns = [GridItem()]
    var body: some View {
        NavigationView {
        ScrollView {
            LazyVGrid(columns: oneColumns) {
                Text(viewModel.viewModel ?? "")
                TopOffersComponentView(viewModel: topOffersViewModel)
                EditorialView()
                RecommendedView(viewModel: recommendedViewMdel)
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
