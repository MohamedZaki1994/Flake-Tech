//
//  RecommendedView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 13/03/2022.
//

import SwiftUI

struct RecommendedView<ViewModel: RecommendedViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    var columns = [GridItem(),GridItem()]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                if let data = viewModel.data {
                    ForEach(data, id:\.self) { recommend in
                        VStack {
                            Text(recommend.name ?? "")
                            Image(recommend.imageName ?? "")
                                .resizable().scaledToFit()
                                .frame(width: 150, height:150)
                        }
                    }
                }
            }
        }
    }
}
