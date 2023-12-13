//
//  ArtWorkCardCollectionViewCell.swift
//  TangApp
//
//  Created by helen branch on 12/13/23.
//

import UIKit

class ArtWorkCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ArtWorkCardCollectionViewCell"

    
    let artWorkInfoItem: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "RectaW01-MediumCondensed", size: 20)
        // Set the text alignment to center
        label.textAlignment = .center
        return label
    }()

        
    let artWorkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image_1")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCard()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        // Return the desired size for the cell content
        return CGSize(width: size.width, height: size.height) 
    }
    
    
    private func setupCard() {
        addSubview(artWorkImage)
        backgroundColor = .blue
        artWorkImage.contentMode = .scaleAspectFit
        artWorkImage.clipsToBounds = true
        artWorkImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]

//         Add constraints for UI elements
        artWorkImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            artWorkImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            artWorkImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            artWorkImage.topAnchor.constraint(equalTo: topAnchor),
            artWorkImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    
    
    
}
