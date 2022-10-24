//
//  ItemData.swift
//  OdaClone
//
//  Created by Thomas Korsnes on 17/10/2022.
//

import Foundation


struct ItemData: Codable {
    var items: [Item]
}

struct Item: Codable, Hashable {
    let product: Product
    var quantity: Int
}

struct Product: Hashable, Codable {
    let id: Int
    let name: String
    let name_extra: String
    let images: [Images]
    let gross_price: String
    let gross_unit_price: String
    let availability: Availability
    let discount: Discount?
    let unit_price_quantity_abbreviation: String
}

struct Images: Hashable, Codable {
    let thumbnail: ThumbnailUrl
}

struct ThumbnailUrl: Hashable, Codable {
    let url: String
}

struct Availability: Hashable, Codable {
    let is_available: Bool
}

struct Discount: Hashable, Codable {
    let is_discounted: Bool
    let undiscounted_gross_price: String
}
