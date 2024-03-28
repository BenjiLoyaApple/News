//
//  Post.swift
//  News
//
//  Created by Benji Loya on 28.03.2024.
//

import Foundation

// MARK: - Post
struct Post: Codable, Identifiable {
    let id: Int
    let title, body: String
    let userID: Int
    let tags: [String]
    let reactions: Int

    enum CodingKeys: String, CodingKey {
        case id, title, body
        case userID = "userId"
        case tags, reactions
    }
}
