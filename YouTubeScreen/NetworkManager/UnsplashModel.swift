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
    let links: UnsplashLinks
    let likes: Int?
    let user: User
    let views: Int?
}

// MARK: - UnsplashLinks
struct UnsplashLinks: Codable {
    let html: String?
}

// MARK: - User
struct User: Codable {
    let username: String?
}

