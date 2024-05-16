//
//  CarouselCell.swift
//  Carousel
//
//  Created by Юрий Мартыненко on 16.05.2024.
//

import UIKit

class CarouselCell: UICollectionViewCell {
    let imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        
        return $0
    }(UIImageView())
    
    let titleLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textAlignment = .center
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [imageView, titleLabel].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
