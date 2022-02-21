//
//  LandingViewModel.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 20/02/2022.
//

import Foundation
import SwiftUI
class LandingViewModel: LandingProtocol {
    @Published var model: String? = "We are one"
    var someView: some View {
        LandingContainerView(landingViewModel: self)
    }
}


protocol LandingProtocol: ObservableObject {
    var model: String? { get }
    associatedtype T
    var someView: T { get }
}

extension LandingProtocol {
    var someView: some View {
        Text("asdjs")
    }
}
