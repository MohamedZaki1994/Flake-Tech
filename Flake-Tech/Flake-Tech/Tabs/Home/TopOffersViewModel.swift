//
//  TopOffersViewModel.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 21/02/2022.
//

import Foundation
import SwiftUI

class TopOffersViewModel: TopOffersViewModelProtocol {
    var activeNavigation: MainAppRouter?
    var offers: [String]? = ["offer1","offer2","offer3","offer4","offer5"]

    init(activeNavigation: MainAppRouter) {
        self.activeNavigation = activeNavigation
    }
    func navigate() -> some View {
        activeNavigation?.view(for: .topOffers)
    }

}

//class TopOffersViewModel<Route: Routing>: TopOffersViewModelProtocol {
//    var activeNavigation: Routing?
//    var offers: [String]? = ["offer1","offer2","offer3","offer4","offer5"]
//
////    init(activeNavigation: MainAppRouter) {
////        self.activeNavigation = activeNavigation
////    }
//    func navigate() -> some View {
//        activeNavigation
//        activeNavigation?.view(for: .topOffers)
//    }

//}

protocol TopOffersViewModelProtocol: ViewModelProtocol {
    var offers: [String]? { get }
}
