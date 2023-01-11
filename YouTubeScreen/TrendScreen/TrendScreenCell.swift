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
        guard let url = URL(string: data.link) else { return }
        videoImage.load(url: url)
    }
    
    override func layoutSubviews() {
        videoImage.pin
            .top(pin.safeArea)
            .left(pin.safeArea)
            .right(pin.safeArea)
            .bottom(pin.safeArea)
        self.contentView.addSubview(videoImage)
        self.backgroundColor = .brown
    }
}
