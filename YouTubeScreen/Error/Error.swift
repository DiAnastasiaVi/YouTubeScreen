//
//  Error.swift
//  YouTubeScreen
//
//  Created by Anastasia on 10.01.2023.
//

import Foundation

enum CustomError: Error {
    case noInternetConnection
    case unexpected
}

extension CustomError {
    var isFatal: Bool {
        if case CustomError.unexpected = self { return true }
        else { return false }
    }
}

extension CustomError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .noInternetConnection:
            return "No Internet"
        case .unexpected:
            return "Something went wrong"
        }
    }
}
