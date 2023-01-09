//
//  TrendScreenViewController.swift
//  YouTubeScreen
//
//  Created by Anastasia on 09.01.2023.
//

import UIKit

enum TrendScreenEvents {
    case something
}

class TrendScreenViewController: UIViewController, StoryboardLoadable {
    
    //MARK: -
    //MARK: Properties
    
    public var eventHandler: ((TrendScreenEvents) -> Void)?
    //тут буде моделька
    private var mainView: TrendScreenView? {
        return self.view as? TrendScreenView
    }
    
    //MARK: -
    //MARK: Init and Deinit
    
    public static func startVC() -> TrendScreenViewController {
        let contr = self.loadFromStoryboard(storyboardName: "TrendScreen")
        return contr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView?.commonSetup()
        self.mainView?.videoCollection?.delegate = self
        self.mainView?.videoCollection?.dataSource = self
    }
    
    deinit {
        print("Deinit: \(Self.self)")
    }
}


