//
//  TopOffersDetailsView.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 10/03/2022.
//

import SwiftUI

struct TopOffersView<ViewModel: TopOffersViewModelProtocol>: View {
    var viewModel: ViewModel
    @State var productSize = "100 x 60"
    @State var productColor = "White"
    @State var size: Double = 0
    @State var quantity = 1
    @State var isFavorite = false
    @State var showFavoriteAlert = false
    var body: some View {
        List {
            ZStack(alignment: .topLeading) {
                Image("accessories")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                HStack(alignment: .top) {
                    ZStack {
                        Star(corners: 8, smoothness: 0.7)
                            .fill(.red)
                            .frame(width: 100, height: 100)
                            .opacity(0.6)
                        Text("Sale")
                            .font(.system(size: 24))
                            .padding()
                    }
                    Spacer()
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(isFavorite ? .red : .white)
                        .padding()
                        .animation(.default, value: isFavorite)
                        .onTapGesture {
                            isFavorite.toggle()
                            showFavoriteAlert.toggle()
                        }
                        .alert(isPresented: $showFavoriteAlert) {
                            Alert(title: Text("Item has been added"), dismissButton: .default(Text("Got it!")))
                        }.onChange(of: showFavoriteAlert) { newValue in
                            if newValue {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    self.showFavoriteAlert = false
                                }
                            }
                        }
                }
            }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            Text("Hello, World!\(viewModel.data ?? "")")
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
            SizePicker(productSize: $productSize)
            ColorPicker(productColor: $productColor)
                .listRowSeparator(.hidden)
            HStack {
                Button(action: {
                    print("add to card")
                }, label: {
                    Text("Add to card")
                })
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(5)
                    .buttonStyle(BorderedButtonStyle())
                    .padding(.leading, 10)
                Text("\(quantity)").padding()
                Stepper("", value: $quantity, in: 1...50).frame(width: 100)
            }.listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())

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
            }.pickerStyle(SegmentedPickerStyle())
            Text("You selected: \(productSize)")
        }
        .navigationTitle(productSize)
    }
}

enum ProductColor: String, CaseIterable {
    case white = "White"
    case black = "Black"
    case walnut = "Walnut"
    case radiance_Oak = "Radiance Oak"
}

struct ColorPicker: View {
    @State var currentColor = Color.white
    @Binding var productColor: String
    var allColors = ProductColor.allCases.map{ $0.rawValue }

    var body: some View {
        VStack {
            Picker("Please choose a color", selection: $productColor) {
                ForEach(allColors, id: \.self) {
                    Text($0)
                }
            }.pickerStyle(SegmentedPickerStyle())
                .onChange(of: productColor) { newValue in
                    switch newValue {
                    case "White":
                        currentColor = .white
                    case "Black":
                        currentColor = .black
                    case "Walnut":
                        currentColor = .walnut
                    case "Radiance Oak":
                        currentColor = .radianceOak
                    default:
                        currentColor = .red
                    }
                }
            HStack {
                Text("You selected: \(productColor)")
                Spacer()
                RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(.black, lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 5).fill(currentColor))
                    .frame(width: 30, height: 30)
            }
        }
        .navigationTitle(productColor)
    }
}

extension Color {
    static var radianceOak: Color { Color(red: 187/255, green: 144/255, blue: 88/255) }
    static var walnut: Color { Color(red: 119/255, green: 63/255, blue: 26/255) }
}
