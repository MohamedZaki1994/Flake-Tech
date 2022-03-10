//
//  TopOffersDetailsViewModel.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 10/03/2022.
//

import Foundation

class TopOffersDetailsViewModel<Route: Routing>: TopOffersDetailsViewModelProtocol {
    var activeNavigation: Route?
    var data: String? = "hell"

}

protocol TopOffersDetailsViewModelProtocol: ViewModelProtocol {
    var data: String? { get }
}
