//
//  HomeViewModel.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 21/02/2022.
//

import Foundation
import SwiftUI
class HomeViewModel<Route: Routing>: HomeViewModelProtocol {
    @Published var viewModel: String? = "welcome to news"
    var activeNavigation: Route?
    init(router: Route) {
        activeNavigation = router
    }
    func navigate() -> some View {
        Text("yes done")
    }
}

protocol HomeViewModelProtocol: ViewModelProtocol {
    var viewModel: String? { get }
}
