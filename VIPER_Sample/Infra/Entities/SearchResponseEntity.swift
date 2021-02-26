//
//  SearchResponseEntity.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/25.
//

import Foundation

struct SearchResponseEntity<Item: Decodable>: Decodable {
    let totalCount: Int
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
