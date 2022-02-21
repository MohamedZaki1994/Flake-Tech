//
//  HomeView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 21/02/2022.
//

import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        ScrollView {
            VStack {
                Text(viewModel.viewModel ?? "")
                TopOffersView()
                EditorialView()
            }.padding()
        }
    }
}
