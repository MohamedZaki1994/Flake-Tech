//
//  TopOffersDetailsView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 10/03/2022.
//

import SwiftUI

struct TopOffersView<ViewModel: TopOffersViewModelProtocol>: View {
    var viewModel: ViewModel
    @State var productSize = ""
    @State var size: Double = 0
    var body: some View {
        List {
            ZStack(alignment: .topLeading) {
                Image("accessories")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                ZStack {
                    Star(corners: 8, smoothness: 0.7)
                        .fill(.red)
                        .frame(width: 100, height: 100)
                        .opacity(0.6)
                    Text("Sale")
                        .font(.system(size: 24))
                        .padding()
                }
            }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            Text("Hello, World!\(viewModel.data ?? "")")
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
//            Slider(value: $size, in: 0...5)

//            VStack {
//                Text("Choose a size")
//                Picker("Choose a size", selection: $productSize) {
//                    Text("100 x 60")
//                    Text("120 x 60")
//                    Text("140 x 80")
//                    Text("160 x 80")
//                } .frame(height: 50)
//            }
//            .listRowSeparator(.hidden)
//            .listRowInsets(EdgeInsets())
//            SizePicker()
            NavigationLink((!productSize.isEmpty) ? "\(productSize)" : "Choose a size") {
                SizePicker(productSize: $productSize)
            }
            .navigationBarTitleDisplayMode(.large)

            Spacer()
                .listRowSeparator(.hidden)
        }.listStyle(PlainListStyle())

    }
}

struct SizePicker: View {
    @Binding var productSize: String
    var array = ["100 x 60","120 x 60","140 x 80","160 x 80"]

    var body: some View {
        VStack {
            Picker("Please choose a color", selection: $productSize) {
                ForEach(array, id: \.self) {
                    Text($0)
                }
            }.pickerStyle(WheelPickerStyle())
            Text("You selected: \(productSize)")
        }
        .navigationTitle("\( productSize ?? "5" )")
        .navigationBarTitleDisplayMode(.large)
    }
}
