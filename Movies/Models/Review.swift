//
//  Review.swift
//  Movies
//
//  Created by LiewSyetChau on 2/3/22.
//

import Foundation

struct ReviewResponse: Codable {
    var results: [Review]
}

struct Review: Codable, Identifiable {
    var id: String?
    var author: String?
    var content: String?
}
