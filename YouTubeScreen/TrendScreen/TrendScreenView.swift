//
//  TrendScreenView.swift
//  YouTubeScreen
//
//  Created by Anastasia on 09.01.2023.
//

import UIKit

class TrendScreenView: UIView {
    
    //MARK: -
    //MARK: Properties
    
    @IBOutlet weak var scrollView: UIScrollView?
    @IBOutlet weak var tabBar: UITabBar?
    @IBOutlet weak var videoCollection: UICollectionView?
    
    internal var cellId = "cell"
    
    //MARK: -
    //MARK: Public Methods
    
    public func commonSetup() {
        videoCollectionSetup()
    }
    
    //MARK: -
    //MARK: Private Methods
    
    private func videoCollectionSetup() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.7)
        videoCollection?.collectionViewLayout = layout
        videoCollection?.register(TrendScreenCell.self, forCellWithReuseIdentifier: cellId)
        self.addSubview(videoCollection ?? UICollectionView())
        videoCollection?.translatesAutoresizingMaskIntoConstraints = false
    }

    
}
