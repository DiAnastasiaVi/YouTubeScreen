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
        image.contentMode = .scaleToFill
        image.backgroundColor = .blue
        return image
    }()
    
    public func setData(_ data: ImageData) {
        self.contentView.addSubview(videoImage)
        guard let url = URL(string: data.link) else { return }
        videoImage.load(url: url)
    }
    
    override func layoutSubviews() {
        
        videoImage.pin
            .top(pin.safeArea)
            .left(pin.safeArea).margin(10)
            .right(pin.safeArea)
            .bottom(pin.safeArea).margin(10)
        self.backgroundColor = .brown
    }
}
