//
//  TrendScreenCell.swift
//  YouTubeScreen
//
//  Created by Anastasia on 09.01.2023.
//

import UIKit
import PinLayout

class TrendScreenCell: UICollectionViewCell {
    
    enum Sizes {
        static let userPhotoSize: CGFloat = 30
        static let videoSettingsSize: CGFloat = 15
        static let margin: CGFloat = 7
        static let leftMargin: CGFloat = userPhotoSize + 15
    }
    
    //MARK: -
    //MARK: Properties
    
    internal var cellId = "cell"
    internal var model = TrendScreenModel()
    internal var videoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    internal var videoName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.isUserInteractionEnabled = false
        return label
    }()
    internal var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.adjustsFontSizeToFitWidth = true
        label.isUserInteractionEnabled = false
        return label
    }()
    internal var userPhoto: UIButton = {
        let photo = UIButton()
        photo.isUserInteractionEnabled = false
        photo.contentScaleFactor = .greatestFiniteMagnitude
        photo.imageView?.contentMode = .scaleToFill
        photo.contentMode = .center
        return photo
    }()
    internal var videoSettings: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.tintColor = .gray
        return button
    }()

    //MARK: -
    //MARK: Public Methods
    
    public func setData(_ data: ImageData) {
        self.contentView.addSubview(videoImage)
        self.contentView.addSubview(videoName)
        self.contentView.addSubview(userPhoto)
        self.contentView.addSubview(infoLabel)
        self.contentView.addSubview(videoSettings)
        videoSettings.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        userPhoto.setImage(UIImage(named: "1resized"), for: .normal)
        guard let url = URL(string: data.link) else { return }
        videoImage.load(url: url)
        videoName.text = data.altDescription
        infoLabel.text = "\(data.user) * \(data.likes) likes * \(data.createdAt)"
    }
   
    public override func layoutSubviews() {
        let width = safeAreaLayoutGuide.layoutFrame.width
        let height = safeAreaLayoutGuide.layoutFrame.height
        let videoNameHeight = (height - videoImage.layer.frame.size.height) * 0.7
        
        videoImage.pin
            .top(pin.safeArea)
            .left(pin.safeArea)
            .right(pin.safeArea)
        videoImage.layer.frame.size = CGSize(width: width, height: width * 0.55)
        
        videoName.pin
            .below(of: videoImage)
            .before(of: videoSettings)
            .left(Sizes.leftMargin)
        videoName.layer.frame.size = CGSize(width: width * 0.8, height: videoNameHeight)
        
        infoLabel.pin
            .below(of: videoName)
            .before(of: videoSettings)
            .left(Sizes.leftMargin)
            .bottom()
        infoLabel.layer.frame.size = CGSize(width: width * 0.8, height: height - videoImage.layer.frame.size.height - videoName.layer.frame.size.height)
        
        userPhoto.pin
            .below(of: videoImage).margin(Sizes.margin)
            .left()
        userPhoto.layer.frame.size = CGSize(width: Sizes.userPhotoSize, height: Sizes.userPhotoSize)
        
        videoSettings.pin
            .below(of: videoImage)
            .right(Sizes.margin)
        videoSettings.layer.frame.size = CGSize(width: Sizes.videoSettingsSize, height: Sizes.videoSettingsSize)
    }
}
