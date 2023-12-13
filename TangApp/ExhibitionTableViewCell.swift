//
//  ExhibitionTableViewCell.swift
//  TangAppT2
//
//  Created by helen branch on 12/7/23.
//

import UIKit

class ExhibitionTableViewCell: UITableViewCell {
    
    static let identifier = "ExhibitionTableViewCell"
    
    
    let exhibitionTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "RectaW01-MediumCondensed", size: 30)
        label.text = "Exhibition Title"
        // Set the text alignment to center
        label.textAlignment = .center
        return label
    }()
        
    let exhibitionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image_1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .purple
        
        contentView.addSubview(exhibitionImage)
        contentView.addSubview(exhibitionTitle)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        // Return the desired size for the cell content
        return CGSize(width: size.width, height: 200.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Calculate the center of the content view
        let centerX = contentView.frame.width / 2
        let centerY = contentView.frame.height / 2

        // Calculate the position and size for the exhibitionImage
        let imageWidth = contentView.frame.height + 20
        let imageHeight = contentView.frame.height - 10
        
        let imageX = centerX - imageWidth/2
        let imageY = centerY - imageHeight/2

        exhibitionImage.frame = CGRect(x: imageX, y: imageY, width: imageWidth, height: imageHeight)
        
        exhibitionTitle.frame = CGRect(x: imageX, y: imageY, width: imageWidth, height: imageHeight)
    }
    
}
