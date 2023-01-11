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
    internal var model = TrendScreenModel()
    internal var videoImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.contentMode = .scaleAspectFit
        image.layer.frame.size = CGSize(width: 200, height: 170)
        return image
    }()
    internal var videoName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.numberOfLines = 2
        label.layer.frame.size = CGSize(width: 130, height: 43)
        label.adjustsFontSizeToFitWidth = true
        label.isUserInteractionEnabled = false
        return label
    }()
    internal var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .gray
        label.layer.frame.size = CGSize(width: 130, height: 17)
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
        button.tintColor = .gray
        return button
    }()
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//       fatalError("NOT IMPLEMENTED")
//    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.contentView.addSubview(videoImage)
//        self.contentView.addSubview(videoName)
//        self.contentView.addSubview(userPhoto)
//        self.contentView.addSubview(infoLabel)
//        self.contentView.addSubview(videoSettings)
//    }
    
    public func setData(_ data: ImageData) {
        self.contentView.addSubview(videoImage)
        self.contentView.addSubview(videoName)
        self.contentView.addSubview(userPhoto)
        self.contentView.addSubview(infoLabel)
        self.contentView.addSubview(videoSettings)
        videoSettings.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        userPhoto.image = UIImage(named: "1resized")
        guard let url = URL(string: data.link) else { return }
        videoImage.load(url: url)
        videoName.text = data.altDescription
        infoLabel.text = "\(data.user) * \(data.likes) likes * \(data.createdAt)"
    }
    
    override func layoutSubviews() {
        videoImage.pin
            .top(pin.safeArea)
            .left(pin.safeArea)
            .right(pin.safeArea)
        
        videoName.pin
            .below(of: videoImage)
            .left(35)
            .right(15)
        
        infoLabel.pin
            .below(of: videoName)
            .left(35)
            .right(15)
            .bottom()
        
        userPhoto.pin
            .below(of: videoImage)
            .left()
        
        videoSettings.pin
            .below(of: videoImage)
            .right(5)
            .after(of: videoName)
    }
}
