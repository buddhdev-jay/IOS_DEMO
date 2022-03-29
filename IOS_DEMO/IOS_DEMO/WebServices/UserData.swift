//
//  UserData.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 28/03/22.
//

import Foundation

struct SingleUserData: Codable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}

struct SingleUserSupport: Codable {
    let url: String
    let text: String
}

struct SingleUserResponse: Codable {
    let data: SingleUserData
    let support: SingleUserSupport
}

