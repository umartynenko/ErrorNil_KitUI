//
//  MessageCell.swift
//  ErrorNil_UIKit_HW10
//
//  Created by Юрий Мартыненко on 29.04.2024.
//

import UIKit


class MessageCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "MessageCell"
    
    override init(frame: CGRect) {
        super.init(frame:  frame)
        
        backgroundColor = .appGrayCell
        clipsToBounds = true
        layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = AppElements.createImage(corner: 20, width: 60)
    lazy var textLabel: UILabel = AppElements.createLabel(fontSize: 14)
    
    func setupCell(item: ItemCollection) {
        addSubview(imageView)
        addSubview(textLabel)
        
        imageView.image = UIImage(named: item.image)
        textLabel.text = item.text
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            textLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            textLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10)
        ])
    }
}
