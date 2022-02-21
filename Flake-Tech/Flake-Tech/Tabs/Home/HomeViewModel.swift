//
//  HomeViewModel.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 21/02/2022.
//

import Foundation
import SwiftUI
class HomeViewModel: HomeViewModelProtocol {
    @Published var viewModel: String? = "welcome to news"
    var someView: some View {
        HomeView(viewModel: self)
    }
}

protocol HomeViewModelProtocol: ObservableObject {
    var viewModel: String? { get }
    associatedtype View
    var someView: View { get }
}
