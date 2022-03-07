//
//  TopOffersView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 21/02/2022.
//

import SwiftUI

struct TopOffersView: View {
    var offers = ["offer1","offer2","offer3","offer4","offer5"]
    var body: some View {
        VStack {
            Text("Best offers")
            TabView() {
                ForEach(offers, id: \.self) { offer in
                    Text(offer).frame(width: UIScreen.main.bounds.width)
                }
            }.tabViewStyle(PageTabViewStyle())
                .frame(height: 200)
                .background(Color.gray)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 4, y: 2)
            Spacer()
        }

    }
}
