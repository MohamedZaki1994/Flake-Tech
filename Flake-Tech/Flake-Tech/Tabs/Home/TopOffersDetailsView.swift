//
//  TopOffersDetailsView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 10/03/2022.
//

import SwiftUI

struct TopOffersDetailsView<ViewModel: TopOffersDetailsViewModelProtocol>: View {
    var viewModel: ViewModel
    var body: some View {
        Text("Hello, World!\(viewModel.data ?? "")")
    }
}
