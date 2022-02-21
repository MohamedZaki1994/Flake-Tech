//
//  CategoryItemView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 21/02/2022.
//

import SwiftUI

struct CategoryItemView: View {
    @ObservedObject var item: CategoryModel
    var body: some View {
        VStack {
            Image(item.imageName ?? "")
                .resizable()
                .scaledToFit()
                .overlay(Rectangle()
                            .background(Color.gray)
                            .opacity(0.2))
                .frame(width: 150, height:200)
            Text(item.name ?? "").padding()
        }
    }
}

