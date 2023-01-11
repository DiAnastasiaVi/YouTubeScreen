//
//  VideoCollectionExtension.swift
//  YouTubeScreen
//
//  Created by Anastasia on 09.01.2023.
//

import Foundation
import UIKit

extension TrendScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.videoData.map{$0.user}.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TrendScreenCell else { return UICollectionViewCell() }
        cell.setData(model.videoData[indexPath.row])
        return cell
    }
}


