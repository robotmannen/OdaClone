//
//  ContentView.swift
//  OdaClone
//
//  Created by Thomas Korsnes on 17/10/2022.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var viewModel = CartViewModel()
    
    var body: some View {
        Text("Shopping Cart")
            .bold()
            .padding()
        VStack {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem()]) {
                        if let cardItems = viewModel.itemsInCart {
                            ForEach(cardItems, id: \.product.id) { groceries in
                                GroceryCardView(item: groceries) {
                                    var addNewGrocery = groceries
                                    print(groceries.product.name)
                                    addNewGrocery.quantity += 1
                                    viewModel.addItemToCart(groceryItem: addNewGrocery)
                                } removeHandler: {
                                    var removeGrocery = groceries
                                    removeGrocery.quantity -= 1
                                    viewModel.removeItemFromCard(groceryItem: removeGrocery)
                                }
                            }
                        }
                    }
                }
                LoaderView().hidden(viewModel.isLoading)
            }
            
            //HStack needs to be hidden if no groceries are selected
            HStack {
                Image(systemName: "cart")
                Text("\(viewModel.getNumberOfGroceries()) products")
                Spacer()
                Text("kr \(viewModel.getPriceOfGroceries())")
            }
            .padding(.horizontal)
        }
        .environmentObject(viewModel)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
