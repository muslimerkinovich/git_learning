//
//  Post.swift
//  udemy_17_Hacker_News
//
//  Created by Muslim on 20/04/23.
//

import Foundation

struct Response: Codable {
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let url: String?
    let points: Int
}
