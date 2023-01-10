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
    
    let jsonURL = "https://images.unsplash.com/photos/random?count=4"
    
    func getImageData(completion: @escaping ([ImageData]?) -> Void, onFailure: @escaping (CustomError) -> ()) {
        
        let request = AF.request(jsonURL, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: HTTPHeaders.default)
        if let url = URL(string: jsonURL) {
           var urlRequest = URLRequest(url: url)
            urlRequest.setValue("Client-ID vds0dxJ6TfFVFwLQu0EFnaxdMfl4J2AbFd9O6Dewd4s", forHTTPHeaderField: "Authorization") }
           
        
        request.validate().responseDecodable(of: ImageData.self) { response in
            switch response.result {
            case .success(let data):
                completion([ImageData(id: data.id, width: data.width, height: data.height, color: data.color, urls: data.urls)])
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

