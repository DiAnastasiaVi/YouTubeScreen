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
        image.adjustsImageSizeForAccessibilityContentSizeCategory = true
        image.backgroundColor = .blue
        return image
    }()
    internal var videoName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 2
        label.backgroundColor = .gray
        label.layer.frame.size = CGSize(width: 150, height: 35)
//        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    internal var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.backgroundColor = .green
        label.layer.frame.size = CGSize(width: 150, height: 25)
        return label
    }()
    internal var userPhoto: UIImageView = {
        let photo = UIImageView()
        photo.layer.frame.size = CGSize(width: 30, height: 30)
        return photo
    }()
    
    
    public func setData(_ data: ImageData) {
        self.contentView.addSubview(videoImage)
        self.contentView.addSubview(videoName)
        self.contentView.addSubview(userPhoto)
        self.contentView.addSubview(infoLabel)
        userPhoto.image = UIImage(named: "1resized")
        guard let url = URL(string: data.link) else { return }
        videoImage.load(url: url)
        videoName.text = data.altDescription
        print(data.altDescription)
        infoLabel.text = "\(data.user) * \(data.likes) likes * \(data.createdAt)"
    }
    
    override func layoutSubviews() {
        videoImage.pin
            .top(pin.safeArea)
            .left(pin.safeArea)
            .right(pin.safeArea)
            .bottom(60)
        videoName.pin
            .below(of: videoImage)
            .after(of: userPhoto)
            .above(of: infoLabel)
            .right(30)
        infoLabel.pin
            .below(of: videoName)
            .after(of: userPhoto)
            .right(30)
            .bottom()
        userPhoto.pin
            .below(of: videoImage)
            .left()
            .bottom(30)
            .before(of: videoName)
        
        self.backgroundColor = .brown
    }
}
