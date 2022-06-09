//
//  RecommendedViewModel.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 13/03/2022.
//

import Foundation

class RecommendedViewModel<Route: Routing>: RecommendedViewModelProtocol where Route.Route == AppRoutes {
    var activeNavigation: Route?

    init(route: Route) {
        self.activeNavigation = route
    }
    var data: [RecommendedModel]? = [RecommendedModel(name: "arm", imageName: "arm", price: 15),
                                     RecommendedModel(name: "storage", imageName: "storage", price: 15),
                                     RecommendedModel(name: "seat", imageName: "seat", price: 15),
                                     RecommendedModel(name: "cchair", imageName: "cchair", price: 15),
                                     RecommendedModel(name: "storageSide", imageName: "storageSide", price: 15),]

}

protocol RecommendedViewModelProtocol: ViewModelProtocol {
    var data: [RecommendedModel]? { get }
}

struct RecommendedModel: Codable, Hashable {
    var id = UUID()
    var name: String?
    var imageName: String?
    var price: Double?
}
