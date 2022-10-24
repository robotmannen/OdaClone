//
//  File.swift
//  OdaClone
//
//  Created by Thomas Korsnes on 17/10/2022.
//

import SwiftUI


@MainActor
class CartViewModel: ObservableObject {
    
    @Published var groceriesData: ItemData? = nil {
        didSet {
            itemsInCart = groceriesData?.items
        }
    }
    //Items in cart not stored properly in UserDefaults - this will be solved later
    @Published var itemsInCart: [Item]? = nil {
        didSet {
            if ((groceriesData?.items.isEmpty) != nil) {
                isLoading = true
            }
            do {
                let data = try JSONEncoder().encode(itemsInCart)
                UserDefaults.standard.set(data, forKey: "itemsInCart")
            } catch {
                print("FEIL!!!111!")
            }
        }
    }
    
    private let dataService = DataService()
    @Published var isLoading: Bool = false
    
    init() {
        fetchGroceries()
        
        itemsInCart = (UserDefaults.standard.array(forKey: "itemsInCart") as? [Item]) ?? []
    }
    
    @MainActor
    func fetchGroceries() {
        Task {
            do {
                groceriesData = try await dataService.fetchItems()
                
            } catch {
                print(error)
                groceriesData = nil
            }
        }
    }
    
    @MainActor
    func addItemToCart(groceryItem: Item) {
        let index = itemsInCart?.firstIndex(where: { $0.product.id == groceryItem.product.id })
        itemsInCart?[index ?? 0] = groceryItem
    }
    
    @MainActor
    func removeItemFromCard(groceryItem: Item) {
        let index = itemsInCart?.firstIndex(where: { $0.product.id == groceryItem.product.id })
        itemsInCart?[index ?? 0] = groceryItem
    }
    
    //This function returns a Double with waay too many zeroes on some numbers
    //Needs to be able to trim off trailing zeroes
    @MainActor
    func getPriceOfGroceries() -> String {
        var sumTotalOfCart = 0.0
        itemsInCart?.forEach {
            if $0.quantity > 0 {
                sumTotalOfCart += (Double($0.product.gross_price) ?? 0.0) * Double($0.quantity)
            }
        }
        return String(sumTotalOfCart)
    }
    
    @MainActor
    func getNumberOfGroceries() -> Int {
        var numberOfGroceries = 0
        itemsInCart?.forEach {
            numberOfGroceries += $0.quantity
        }
        return numberOfGroceries
    }
}
