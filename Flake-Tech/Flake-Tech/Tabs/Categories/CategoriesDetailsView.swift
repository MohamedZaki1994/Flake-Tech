//
//  CategoriesDetailsView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 27/02/2022.
//

import SwiftUI

struct CategoriesDetailsView<ViewModel: CategoriesDetailsViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        Text("Hello, Categories")
    }
}
