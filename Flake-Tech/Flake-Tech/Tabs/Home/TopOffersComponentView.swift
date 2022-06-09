//
//  TopOffersView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 21/02/2022.
//

import SwiftUI

struct TopOffersComponentView<ViewModel: TopOffersComponentViewModelProtocol>: View {
    var viewModel: ViewModel
    @State var shouldNavigate = false
    var body: some View {
        VStack {
            Text("Best offers")
            TabView() {
                ForEach(viewModel.offers ?? [], id: \.self) { offer in
                    TopOfferItemView().frame(width: UIScreen.main.bounds.width)
                        .onTapGesture {
                            shouldNavigate = true
                        }
                }.padding(.bottom, 30)
            }.tabViewStyle(PageTabViewStyle())
                .frame(height: 300)
                .background(Color.gray)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 4, y: 2)
            Spacer()
        }
        .onAppear {
            shouldNavigate = false
        }
        NavigationLink(isActive: $shouldNavigate) {
            viewModel.navigate()
        } label: {
            EmptyView()
        }
    }
}
