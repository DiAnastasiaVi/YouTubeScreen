//
//  Coordinator.swift
//  YouTubeScreen
//
//  Created by Anastasia on 09.01.2023.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}
