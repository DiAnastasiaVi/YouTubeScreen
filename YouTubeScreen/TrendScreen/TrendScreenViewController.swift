//
//  TrendScreenViewController.swift
//  YouTubeScreen
//
//  Created by Anastasia on 09.01.2023.
//

import UIKit

class TrendScreenViewController: UIViewController, StoryboardLoadable {
    
    //MARK: -
    //MARK: Properties
    
    //тут буде моделька
    
    //MARK: -
    //MARK: Init and Deinit
    
    public static func startVC() -> TrendScreenViewController {
        let contr = self.loadFromStoryboard(storyboardName: "TrendScreen")
        return contr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("Deinit: \(Self.self)")
    }
}


