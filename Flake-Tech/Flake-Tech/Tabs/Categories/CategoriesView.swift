//
//  CategoriesView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 21/02/2022.
//

import SwiftUI

struct CategoriesView<ViewModel: CategoriesProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    var twoColumns = [GridItem(),GridItem()]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: twoColumns) {
                if let model = viewModel.model {
                    ForEach(model, id: \.id) { item in
                        CategoryItemView(item: item)
                    }
                }
            }.onAppear {
                viewModel.fetchCategories()
            }
        }
    }
}
