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
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        guard let widthCell = videoCollection?.frame.width else { return }
        guard let heightCell = videoCollection?.frame.height else { return }
        layout.itemSize = CGSize(width: widthCell, height: heightCell / 2.5)
        
        
        videoCollection?.collectionViewLayout = layout
        videoCollection?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    private func videoCollectionConstreints() {
    }
    
    
    
    
    
}
