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
//        image.adjustsImageSizeForAccessibilityContentSizeCategory = true
        image.backgroundColor = .blue
        image.contentMode = .scaleAspectFill
        image.layer.frame.size = CGSize(width: 150, height: 190)
        return image
    }()
    internal var videoName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 2
        label.backgroundColor = .gray
        label.layer.frame.size = CGSize(width: 150, height: 43)
        label.adjustsFontSizeToFitWidth = true
        label.isUserInteractionEnabled = false
        return label
    }()
    internal var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.backgroundColor = .green
        label.layer.frame.size = CGSize(width: 150, height: 17)
        label.adjustsFontSizeToFitWidth = true
        label.isUserInteractionEnabled = false
        return label
    }()
    internal var userPhoto: UIImageView = {
        let photo = UIImageView()
        photo.layer.frame.size = CGSize(width: 30, height: 30)
        photo.isUserInteractionEnabled = false
        return photo
    }()
    internal var videoSettings: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.layer.frame.size = CGSize(width: 15, height: 15)
        button.backgroundColor = .black
        return button
    }()
    
    public func setData(_ data: ImageData) {
        self.contentView.addSubview(videoImage)
        self.contentView.addSubview(videoName)
        self.contentView.addSubview(userPhoto)
        self.contentView.addSubview(infoLabel)
        self.contentView.addSubview(videoSettings)
        userPhoto.image = UIImage(named: "1resized")
        guard let url = URL(string: data.link) else { return }
        videoImage.load(url: url)
        videoName.text = data.altDescription
        infoLabel.text = "\(data.user) * \(data.likes) likes * \(data.createdAt)"
    }
    
    override func layoutSubviews() {
        videoImage.pin
            .top()
            .left()
            .right()
            .bottom(60)
        
        videoName.pin
            .below(of: videoImage)
            .after(of: userPhoto)
            .above(of: infoLabel)
            .right(15)
        
        infoLabel.pin
            .below(of: videoName)
            .left(30)
            .right(15)
            .bottom()
        
        userPhoto.pin
            .below(of: videoImage)
            .left()
            .bottom(30)
            .before(of: videoName)
        
        videoSettings.pin
            .below(of: videoImage)
            .right()
            .after(of: videoName)
            .bottom(45)
        
        self.backgroundColor = .brown
    }
}
