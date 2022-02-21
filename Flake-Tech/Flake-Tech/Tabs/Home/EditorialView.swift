//
//  EditorialView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 21/02/2022.
//

import SwiftUI

struct EditorialView: View {
    @State var hasImage = true
    @State var hasText = true
    @State var backGroundColor: Color? = .gray
    var body: some View {
        VStack {
            if hasImage {
                Image("desk").resizable().scaledToFit()
            }
            if hasText {
                Text("new offer")
            }
        }
        .background(backGroundColor)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 4, y: 2)
    }
}

struct EditorialView_Previews: PreviewProvider {
    static var previews: some View {
        EditorialView()
    }
}
