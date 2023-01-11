//
//  TrendScreenModel.swift
//  YouTubeScreen
//
//  Created by Anastasia on 10.01.2023.
//

import Foundation

class TrendScreenModel {
    public var videoData: [ImageData] = []
    
    func getData(onSuccess: @escaping () -> (), onFailure: @escaping (String) -> ()) {
        NetworkManager.shared.getImageData() {
            self.videoData = $0 ?? []
            DispatchQueue.main.async {
                onSuccess()
            }
        } onFailure: { error in
            var failureMessage = ""
            switch error {
            case .noInternetConnection:
                failureMessage = CustomError.noInternetConnection.description
            case .unexpected:
                failureMessage = CustomError.unexpected.description
            }
            DispatchQueue.main.async {
                onFailure(failureMessage)
            }
        }
    }
}

struct ImageData: Codable {
    let user: String
    let createdAt: String
    let altDescription: String
    let likes: Int
    let link: String
}
