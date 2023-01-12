//
//  UnsplashModel.swift
//  YouTubeScreen
//
//  Created by Anastasia on 11.01.2023.
//

import Foundation

class UnsplashModel: Codable {
    public var result: [UnsplashElement]
}

struct UnsplashElement: Codable {
    let createdAt: String?
    let altDescription: String?
    let urls: Urls
    let likes: Int?
    let user: User
}

// MARK: - UnsplashLinks
struct Urls: Codable {
    let thumb: String?
}

// MARK: - User
struct User: Codable {
    let username: String?
}

