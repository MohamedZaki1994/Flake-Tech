//
//  LandingContainerView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 20/02/2022.
//

import SwiftUI
import Combine

struct LandingContainerView<ViewModel: LandingProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    var homeViewModel = HomeViewModel(router: AppRouter())
    var categoriesViewModel = CategoriesViewModel(router: AppRouter())
    init(landingViewModel: ViewModel) {
        self.viewModel = landingViewModel
    }
    @State var selectedTab = 1
    @State var searchText: String = ""
    @State private var options: [String] = ["one","two","three"]
    var body: some View {
            TabView(selection: $selectedTab) {
                HomeView(viewModel: homeViewModel)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }.tag(1)
                CategoriesView(viewModel: categoriesViewModel)
                    .tabItem {
                        Image(systemName: "rectangle.split.3x1")
                        Text("Categories")
                    }.tag(2)
                Text("dss").tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }.tag(3)
            }
            .onChange(of: selectedTab) { newSelectedTab in
                // fire fetching
            }
//                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)){
//                    Text("tw").searchCompletion("two")
//                }
        }
}
