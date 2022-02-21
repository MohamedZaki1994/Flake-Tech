//
//  CategoriesViewModel.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 21/02/2022.
//

import Foundation
import SwiftUI

class CategoriesViewModel: CategoriesProtocol {
   @Published var model: [CategoryModel]?
    func fetchCategories() {
        model = [CategoryModel(name: "Decks & Tables", imageName: "desk"),
                 CategoryModel(name: "Seating", imageName: "seat"),
                 CategoryModel(name: "Storage", imageName: "storage"),
                 CategoryModel(name: "Accessories", imageName: "accessories"),
        ]
    }
    var someView: some View {
        CategoriesView(viewModel: self)
    }
}

protocol CategoriesProtocol: ObservableObject {
    var model: [CategoryModel]? { get }
    func fetchCategories()
    associatedtype View
    var someView: View { get }
}

class CategoryModel: Codable, Identifiable, ObservableObject {
    var id = UUID()
    var name: String?
    var imageName: String?
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}
