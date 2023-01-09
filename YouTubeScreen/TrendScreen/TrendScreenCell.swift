//
//  TrendScreenCell.swift
//  YouTubeScreen
//
//  Created by Anastasia on 09.01.2023.
//

import UIKit

class TrendScreenCell: UICollectionViewCell {
    
    internal var cellId = "cell"
    
    private var videoImage: UIImageView = {
        let image = UIImageView(frame: CGRect.zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var authorLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var videoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private func setConstraints() {
        let safeArea = safeAreaLayoutGuide
        videoImage.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
    }
    
    
    
}
