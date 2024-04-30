//
//  NewsCell.swift
//  ErrorNil_UIKit_HW10
//
//  Created by Юрий Мартыненко on 30.04.2024.
//

import UIKit


class NewsCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "NewsCell"
    lazy var imageView: UIImageView = AppElements.createImage(corner: 15, width: 100)
    lazy var title: UILabel = AppElements.createLabel(fontSize: 24, fontWeight: .bold, fontColor: .white)
    lazy var text: UILabel = AppElements.createLabel(fontSize: 14, fontColor: .white)
    
    func setupCell(item: ItemCollection) {
        addSubview(imageView)
        addSubview(title)
        addSubview(text)
        
        imageView.image = UIImage(named: item.image)
        title.text = item.header
        text.text = item.text
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            title.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            text.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 41),
            text.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            text.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            text.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -23)
        ])
    }
}
