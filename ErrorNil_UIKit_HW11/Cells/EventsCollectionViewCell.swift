//
//  EventsCollectionViewCell.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 03.05.2024.
//

import UIKit

class EventsCollectionViewCell: UICollectionViewCell, CellProtocol{
    lazy private var nextViewAction = UIAction { [weak self] action in
        print("next")
    }
    
    static var reuseID: String = "EventsCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        layer.cornerRadius = 10
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = AppElements.createImage(corner: 0)
    lazy var text: UILabel = AppElements.createLabel(lines: 1, color: .black)
    lazy var rightArrowButton: UIButton = AppElements.createButton(setImage: "chevron.right", action: nextViewAction)
    
    
    func setupCell(item: ItemCollection) {
        [imageView, text, rightArrowButton].forEach { addSubview($0) }
        
        imageView.image = UIImage(named: item.image)
        text.text = item.text
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 25),
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            
            text.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            text.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            text.trailingAnchor.constraint(equalTo: rightArrowButton.leadingAnchor, constant: -27),
            
            rightArrowButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            rightArrowButton.widthAnchor.constraint(equalToConstant: 16),
            rightArrowButton.heightAnchor.constraint(equalTo: rightArrowButton.widthAnchor)
        ])
    }
}



