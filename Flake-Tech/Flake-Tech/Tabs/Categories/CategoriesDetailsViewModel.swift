//
//  CategoriesDetailsViewModel.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 27/02/2022.
//

import Foundation

class CategoriesDetailsViewModel: CategoriesDetailsViewModelProtocol {
    @Published var model: [String]? = ["1","2"]
//    var someView: some View {
//        CategoriesDetailsView()
//    }

    func fetchCategoriesDetails() {
        
    }


}

protocol CategoriesDetailsViewModelProtocol: ObservableObject {
//    var model: [String]? { get }
//    func fetchCategoriesDetails()
//    associatedtype View
//    var someView: View { get }
}
