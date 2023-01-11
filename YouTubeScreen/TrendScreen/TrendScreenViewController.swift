//
//  TrendScreenViewController.swift
//  YouTubeScreen
//
//  Created by Anastasia on 09.01.2023.
//

import UIKit

enum TrendScreenEvents {
    case loadData
}

class TrendScreenViewController: UIViewController, StoryboardLoadable {
    
    //MARK: -
    //MARK: Properties
    
    public var eventHandler: ((TrendScreenEvents) -> Void)?
    public var model = TrendScreenModel()
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
        loadData("")
    }
    
    deinit {
        print("Deinit: \(Self.self)")
    }
    
    
    //MARK: -
    //MARK: Private Methods
    
    private func showError(err: String) {
        let alert = UIAlertController(title: "Error", message: err, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func on() {
        LoadingOverlay.shared.showOverlay()
        view.isUserInteractionEnabled = false
    }
    
    private func off() {
        LoadingOverlay.shared.hideOverlayView()
        self.view.isUserInteractionEnabled = true
    }
    
    private func loadData(_ sender: Any) {
        self.on()
        eventHandler?(.loadData)

        model.getData() {
            self.off()
            self.mainView?.videoCollection?.reloadData()
        } onFailure: {text in
            self.showError(err: text)
            self.off()
        }
    }
    
    
}


