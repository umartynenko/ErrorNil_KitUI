//
//  BannerCell.swift
//  ErrorNil_UIKit_HW10
//
//  Created by Юрий Мартыненко on 30.04.2024.
//

import UIKit


class BannerCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "BannerCell"
    
    var imageView: UIImageView = AppElements.createImage(corner: 15)
    
    func setupCell(item: ItemCollection) {
        addSubview(imageView)
        
        imageView.image = UIImage(named: item.image)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
