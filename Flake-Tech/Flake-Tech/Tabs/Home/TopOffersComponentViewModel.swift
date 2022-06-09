//
//  TopOffersComponentViewModel.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 21/02/2022.
//

import Foundation
import SwiftUI

//class TopOffersViewModel: TopOffersViewModelProtocol {
//    var activeNavigation: MainAppRouter?
//    var offers: [String]? = ["offer1","offer2","offer3","offer4","offer5"]
//
//    init(activeNavigation: MainAppRouter) {
//        self.activeNavigation = activeNavigation
//    }
//    func navigate() -> some View {
//        activeNavigation?.view(for: .topOffers)
//    }
//
//}

class TopOffersComponentViewModel<Route: Routing>: TopOffersComponentViewModelProtocol where Route.Route == AppRoutes {
    var activeNavigation: Route?
    var offers: [String]? = ["offer1","offer2","offer3","offer4","offer5"]

    init(activeNavigation: Route) {
        self.activeNavigation = activeNavigation
    }
    func navigate() -> some View {
        activeNavigation?.view(for: .topOffers)
    }

}

protocol TopOffersComponentViewModelProtocol: ViewModelProtocol {
    var offers: [String]? { get }
}
