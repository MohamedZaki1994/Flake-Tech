//
//  TopOffersViewModel.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 10/03/2022.
//

import Foundation

class TopOffersViewModel<Route: Routing>: TopOffersViewModelProtocol {
    var activeNavigation: Route?
    var data: String? = "hellooo"

    init(route: Route) {
        self.activeNavigation = route
    }

}

protocol TopOffersViewModelProtocol: ViewModelProtocol {
    var data: String? { get }
}
