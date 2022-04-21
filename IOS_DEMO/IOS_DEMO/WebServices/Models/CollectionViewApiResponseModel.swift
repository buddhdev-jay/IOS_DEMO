//
//  CollectionViewApiResponseModel.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 19/04/22.
//

import Foundation

struct UsersList: Codable {
    let page, perPage, total, totalPages: Int
    let data: [UserData]
    let support: Support
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case perPage = "per_page"
        case total = "total"
        case totalPages = "total_pages"
        case data = "data"
        case support = "support"
    }
}

struct UserData: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case  email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "avatar"
    }
}

struct Support: Codable {
    let url: String
    let text: String
}
