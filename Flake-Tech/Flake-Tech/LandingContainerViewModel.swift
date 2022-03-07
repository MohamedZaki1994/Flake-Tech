//
//  LandingViewModel.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 20/02/2022.
//

import Foundation
import SwiftUI
class LandingViewModel<T: Routing>: LandingProtocol {
    var activeNavigation: T?
    @Published var model: String? = "We are one"

    init(router: T) {
        self.activeNavigation = router
    }
    var someView: some View {
        LandingContainerView(landingViewModel: self)
    }
}


protocol LandingProtocol: ViewModelProtocol {
    var model: String? { get }
    associatedtype T
    var someView: T { get }
}

//extension LandingProtocol {
//    var someView: some View {
//        Text("asdjs")
//    }
//}
