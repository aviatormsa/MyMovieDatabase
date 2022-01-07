//
//  AuthRequestBody.swift
//  MyMovieDatabase
//
//  Created by macbook pro on 25.12.2021.
//

import Foundation

struct AuthRequestBody: Codable {
    let username, password : String?
}
