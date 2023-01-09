//
//  TrendScreenCell.swift
//  YouTubeScreen
//
//  Created by Anastasia on 09.01.2023.
//

import UIKit

class TrendScreenCell: UICollectionViewCell {
    
    internal var cellId = "cell"
    
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
    
    
    
    
    
    
}
