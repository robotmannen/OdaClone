//
//  DataService.swift
//  OdaClone
//
//  Created by Thomas Korsnes on 17/10/2022.
//

import Foundation

enum NetworkError: Error {
    case misformatUrl
    case dataLoadFailed
}

struct DataService {
    private static let url = "https://api.npoint.io/d4e0a014b1cfc5254bcb"
    
    private func performRequest(_ url: String) async throws -> ItemData {
        if let url = URL(string: url) {
            let (data, _) = try await URLSession.shared.data(from: url)
            var json = try JSONDecoder().decode(ItemData.self, from: data)
            
            json.items.indices.forEach { json.items[$0].quantity = 0 }
            
            print(json)
            return json
        }
        throw NetworkError.misformatUrl
    }
    
    func fetchItems() async throws -> ItemData  {
        let urlString = DataService.url
        return try await performRequest(urlString)
    }
}
