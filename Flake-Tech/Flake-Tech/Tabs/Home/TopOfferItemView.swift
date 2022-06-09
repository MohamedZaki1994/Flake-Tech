//
//  TopOfferItemView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 09/06/2022.
//

import SwiftUI

struct TopOfferItemView: View {
    var body: some View {
        VStack {
            Image("arm")
                .resizable()
                .scaledToFit()
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
            Text("Offer")
        }
    }
}

struct TopOfferItemView_Previews: PreviewProvider {
    static var previews: some View {
        TopOfferItemView()
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
