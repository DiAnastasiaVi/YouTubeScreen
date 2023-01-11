//
//  NetworkManager.swift
//  YouTubeScreen
//
//  Created by Anastasia on 10.01.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    let jsonURL = "https://api.unsplash.com/photos/random/?client_id=vds0dxJ6TfFVFwLQu0EFnaxdMfl4J2AbFd9O6Dewd4s&count=4&orientation=landscape"
    
    func getImageData(completion: @escaping ([ImageData]?) -> Void, onFailure: @escaping (CustomError) -> ()) {
        
        let request = AF.request(jsonURL, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: HTTPHeaders.default)
        
        request.validate().responseDecodable(of: Array<UnsplashElement>.self) { response in
            switch response.result {
            case .success(let data):
                completion(data.compactMap {
                    return ImageData(user: $0.user.username ?? "cOoL gUy", createdAt: $0.createdAt ?? "01.01.01", altDescription: $0.altDescription ?? "This is my first video! Hope you enjoy it!", likes: $0.likes ?? 666, link: $0.urls.thumb ?? "")
                })
                print(data)
            case .failure(let error):
                if response.data == nil {
                    onFailure(CustomError.noInternetConnection)
                    print(error)
                } else {
                    onFailure(CustomError.unexpected)
                    print(error)
                }
            }
        }
    }
}

