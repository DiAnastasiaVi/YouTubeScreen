//
//  TrendScreenView.swift
//  YouTubeScreen
//
//  Created by Anastasia on 09.01.2023.
//

import UIKit

class TrendScreenView: UIView {
    
    
    
    @IBOutlet weak var scrollView: UIScrollView?
    @IBOutlet weak var tabBar: UITabBar?
    @IBOutlet weak var videoCollection: UICollectionView?
    
    
    internal var cellId = "cell"
    
    
    public func commonSetup() {
        videoCollectionConstreints()
        videoCollectionSetup()
    }
    
    private func videoCollectionSetup() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
//        guard let widthCell = videoCollection?.frame.width else { return }
//        guard let heightCell = videoCollection?.frame.height else { return }
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 250)
        
        
        videoCollection?.collectionViewLayout = layout
        videoCollection?.register(TrendScreenCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    private func videoCollectionConstreints() {
    }
    
    
    
    
    
}
