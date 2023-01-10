//
//  TrendScreenCell.swift
//  YouTubeScreen
//
//  Created by Anastasia on 09.01.2023.
//

import UIKit
import PinLayout
import UnsplashPhotoPicker

class TrendScreenCell: UICollectionViewCell {
    
    internal var cellId = "cell"
    internal var model = TrendScreenModel()
    internal var videoImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        return image
    }()
    
    public func setData(_ data: ImageData) {
        self.addSubview(videoImage)
        let url = data.urls
        videoImage.load(url: url)
    }
    
    override func layoutSubviews() {
        videoImage.pin
            .top(pin.safeArea)
            .left(pin.safeArea)
            .right(pin.safeArea)
            .bottom(pin.safeArea)
        self.backgroundColor = .brown
    }
}
