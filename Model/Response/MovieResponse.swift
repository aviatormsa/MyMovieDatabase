//
//  MovieResponse.swift
//  MyMovieDatabase
//
//  Created by macbook pro on 31.12.2021.
//

import Foundation

struct MovieResponse: Codable {
    let page: Int?
    let results: [Result]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
