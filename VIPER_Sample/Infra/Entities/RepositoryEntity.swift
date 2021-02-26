//
//  RepositoryEntity.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/25.
//

import Foundation

struct RepositoryEntity: Decodable {
    let id: Int
    let name: String
    let fullName: String
    let htmlURL: URL
    let starCount: Int
    let owner: UserEntity
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case htmlURL = "html_url"
        case starCount = "star_count"
        case owner
    }
}
