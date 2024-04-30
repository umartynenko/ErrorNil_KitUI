//
//  StoryCell.swift
//  ErrorNil_UIKit_HW10
//
//  Created by Юрий Мартыненко on 29.04.2024.
//

import UIKit


class StoryCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "StoryCell"
    
    lazy var imageView: UIImageView = AppElements.createImage(corner: 40, width: 80)
    lazy var nameLabel: UILabel = AppElements.createLabel(alignment: .center, fontSize: 16)
    
    func setupCell(item: ItemCollection) {
        addSubview(imageView)
        addSubview(nameLabel)
        
        imageView.image = UIImage(named: item.image)
        nameLabel.text = item.name
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
