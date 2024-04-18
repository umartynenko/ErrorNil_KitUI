//
//  ItemCell.swift
//  ErrorNil_UIKit_HW7
//
//  Created by Юрий Мартыненко on 17.04.2024.
//

import UIKit

class ItemCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
    }
    
    func setupCell(item: Item) {
        lazy var cellView: UIView = {
            .config(view: $0) { setupCell in
                setupCell.backgroundColor = .appGray
                setupCell.layer.cornerRadius = 30
            }
        }(UIView(frame: bounds))
        
        lazy var userAvatarImage = AppElements.createImage(name: item.iconImage, corner: 31.5)
        lazy var mainImage = AppElements.createImage(name: item.image, corner: 30)
        lazy var userName = AppElements.createLabel(text: item.userName, fontSize: 20, weight: .bold, color: .white)
        lazy var titleMessage = AppElements.createLabel(text: item.title, fontSize: 20, weight: .bold, color: .black)
        
        lazy var message: UILabel = {
            .config(view: $0) {message in
                message.numberOfLines = 0
                message.text = item.text
            }
        }(UILabel())
        
        lazy var nextButton: UIButton = {
            .config(view: $0) {nextButton in
                nextButton.setTitle("next", for: .normal)
                nextButton.tintColor = .white
                nextButton.layer.cornerRadius = 20
                nextButton.backgroundColor = .appGreen
            }
        }(UIButton())
        
        [userAvatarImage, userName].forEach {mainImage.addSubview($0)}
        [mainImage, titleMessage, message, nextButton].forEach {cellView.addSubview($0)}
        
        addSubview(cellView)
        
        NSLayoutConstraint.activate(
            [
                cellView.topAnchor.constraint(equalTo: topAnchor),
                cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
                cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -22),
                
                mainImage.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
                mainImage.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
                mainImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
                mainImage.heightAnchor.constraint(equalToConstant: 239),
                
                userAvatarImage.topAnchor.constraint(equalTo: mainImage.topAnchor, constant: 20),
                userAvatarImage.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 20),
                userAvatarImage.heightAnchor.constraint(equalToConstant: 63),
                userAvatarImage.widthAnchor.constraint(equalToConstant: 63),
                
                userName.bottomAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: -40),
                userName.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 20),
                userName.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: -20),
                
                titleMessage.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 21),
                titleMessage.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 36),
                titleMessage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -36),
                
                message.topAnchor.constraint(equalTo: titleMessage.bottomAnchor, constant: 20),
                message.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
                message.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
//                message.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20),
                
                nextButton.topAnchor.constraint(equalTo: message.bottomAnchor, constant: 26),
                nextButton.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
                nextButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
                nextButton.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -40),
                nextButton.heightAnchor.constraint(equalToConstant: 50)
                
            ]
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
