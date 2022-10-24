//
//  CircularButtonView.swift
//  OdaClone
//
//  Created by Thomas Korsnes on 18/10/2022.
//

import SwiftUI

struct AddRemoveItemView: View {
    let addHandler: () -> ()
    let removeHandler: () -> ()
    var quantity: Int
    
    var body: some View {
        HStack {
            if quantity > 0 {
            remove
                Text(String(quantity))
                    .padding(5)
            }
            add
        }
    }
    
    var add: some View {
        Button {
            addHandler()
        } label: {
            ZStack {
                Circle()
                    .frame(width: 35, height: 35)
                    .foregroundColor(quantity > 0 ? .white : .orange)
                    .shadow(color: .gray, radius: 1)
                    
                Image(systemName: "plus")
                    .foregroundColor(quantity > 0 ? .black : .white)
            }
        }
    }
    var remove: some View {
        Button {
            removeHandler()
        } label: {
            ZStack {
                Circle()
                    .frame(width: 35, height: 35)
                    .foregroundColor(quantity > 0 ? .white : .orange)
                    .shadow(color: .gray, radius: 1)
                   
                    
                Image(systemName: "minus")
                    .foregroundColor(quantity > 0 ? .black : .white)
            }
        }
    }
}

struct CircularButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddRemoveItemView(addHandler: {}, removeHandler: {}, quantity: 1)
    }
}
