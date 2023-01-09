//
//  ScreensCoordinator.swift
//  YouTubeScreen
//
//  Created by Anastasia on 09.01.2023.
//

import UIKit

enum AvailableScreens {
    case trendScreen
}

final class ScreensCoordinator: Coordinator {
    
    //MARK: -
    //MARK: Constants
    
    public let navigationController: UINavigationController
    
    //MARK: -
    //MARK: Properties
    
    private var navigationScreens: [AvailableScreens] = []
    
    //MARK: -
    //MARK: Init and Deinit
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        self.jumpToScreen(.trendScreen)
    }
    
    // MARK: -
    // MARK: Methods
    
    private func makeTrendScreen() {
        let contr = TrendScreenViewController.startVC()
        self.navigationScreens.append(.trendScreen)
        self.navigationController.navigationBar.isHidden = true
        self.navigationController.pushViewController(contr, animated: true)
        self.navigationController.setViewControllers([contr], animated: false) }
}

//MARK: -
//MARK: Extensions

extension ScreensCoordinator {
    public func jumpToScreen(_ jumpTo: AvailableScreens) {
        switch jumpTo {
        case .trendScreen:
            self.makeTrendScreen()
            
        }
    }
    
}

