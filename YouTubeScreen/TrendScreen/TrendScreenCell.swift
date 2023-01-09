//
//  TrendScreenCell.swift
//  YouTubeScreen
//
//  Created by Anastasia on 09.01.2023.
//

import UIKit
import PinLayout

class TrendScreenCell: UICollectionViewCell {
    
    internal var cellId = "cell"
    
    private var videoImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        return image
    }()
    
    override func layoutSubviews() {
        videoImage.pin
            .top(pin.safeArea)
            .left(pin.safeArea)
            .right(pin.safeArea)
            .bottom(pin.safeArea)
        self.backgroundColor = .brown
        self.addSubview(videoImage)
    }
    
}
