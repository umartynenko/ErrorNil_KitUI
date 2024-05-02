//
//  NewsCollectionViewCell.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 02.05.2024.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "NewsCell"
    lazy var imageView: UIImageView = AppElements.createImage(corner: 20)
    lazy var title: UILabel = AppElements.createLabel(fontSize: 20, fontWeight: .bold)
    lazy var date: UILabel = AppElements.createLabel(fontSize: 12, color: .appColorTextGray)
    lazy var text: UILabel = AppElements.createLabel()
    
    func setupCell(item: ItemCollection) {
        [imageView, title, date, text].forEach { addSubview($0) }
        
        imageView.image = UIImage(named: item.image)
        title.text = item.title
        date.text = item.date
        text.text = item.text
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            title.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 23),
            title.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 25),
            title.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -25),
            
            date.topAnchor.constraint(equalTo: title.bottomAnchor),
            date.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            date.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            
            text.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 9),
            text.leadingAnchor.constraint(equalTo: date.leadingAnchor),
            text.trailingAnchor.constraint(equalTo: date.trailingAnchor),
            text.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -22)
        ])
    }
}
