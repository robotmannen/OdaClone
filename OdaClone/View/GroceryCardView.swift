//
//  GroceryCardView.swift
//  OdaClone
//
//  Created by Thomas Korsnes on 17/10/2022.
//

import SwiftUI


struct GroceryCardView: View {
    
    @EnvironmentObject var viewModel: CartViewModel
    
    let item: Item
    
    //These handle adding and removing items from cart
    let addHandler: () -> ()
    let removeHandler: () -> ()
    
    var body: some View {
        HStack {
            groceryImage
            VStack {
                HStack {
                    Text(item.product.name)
                        .bold()
                    Spacer()
                    Text(item.quantity == 0 ? "kr " + item.product.gross_price : "")
                        .bold()
                }
                HStack {
                    Text(item.product.name_extra)
                        .foregroundColor(Color(UIColor.darkGray))
                    Spacer()
                    Text(item.quantity == 0 ? "kr " + item.product.gross_unit_price + "/" + item.product.unit_price_quantity_abbreviation : "")
                        .foregroundColor(Color(UIColor.darkGray))
                }
            }
            //Closures handle adding and removing items to/from cart
            AddRemoveItemView(addHandler: {
                addHandler()
            }, removeHandler: {
                removeHandler()
            }, quantity: item.quantity)
        }
        .padding(10)
        Divider()
    }
    
    var groceryImage: some View {
        AsyncImage(url: URL(string: item.product.images.first?.thumbnail.url ?? "")) { resize in
            resize
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            Image(systemName: "arrow.clockwise")
        }
        .frame(maxWidth: 50, maxHeight: 50)
    }
}

//Preview not working with current understanding of previews
/*
struct GroceryCardView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryCardView(item: Item) {
            <#code#>
        } removeHandler: {
            
        }
    }
}
*/
