//
//  UsersCollectionViewCell.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 03.05.2024.
//

import UIKit

class UsersCollectionViewCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "UsersCell"
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        clipsToBounds = true
        layer.cornerRadius = 20
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy private var writeButtonAction = UIAction { [weak self] action in
        print("write")
    }
    lazy var imageView: UIImageView = AppElements.createImage(corner: 25)
    lazy var userName: UILabel = AppElements.createLabel(fontWeight: .bold, color: .black, alignment: .center)
    lazy var text: UILabel = AppElements.createLabel(lines: 2, color: .appColorUserCellText, alignment: .center)
    lazy var writeButton: UIButton = AppElements.createButton(
        title: "Написать",
        color: .systemBlue,
        action: writeButtonAction
    )
    
    func setupCell(item: ItemCollection) {
        [imageView, userName, text, writeButton].forEach { addSubview($0) }
        
        imageView.image = UIImage(named: item.image)
        userName.text = item.userName
        text.text = item.text
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            userName.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            userName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            userName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            
            text.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 6),
            text.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            text.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            
            writeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            writeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            writeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            writeButton.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 11),
            writeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17)
        ])
    }
}
