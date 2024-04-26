//
//  CardItem.swift
//  ErrorNil_UIKit_HW9
//
//  Created by Юрий Мартыненко on 25.04.2024.
//

import UIKit


protocol CellProtocol: AnyObject {
    static var reuseId: String {get}
}


class CardItem: UICollectionViewCell, CellProtocol {
    static var reuseId: String = "CardItem"
    
    var viewWidth: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.viewWidth = UIScreen.main.bounds.width
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var cellView: UIView = {
        .config(view: $0) { setupCell in
            setupCell.backgroundColor = .appCellGray
            setupCell.layer.cornerRadius = 30
        }
    }(UIView())
    
    lazy var userImageAvatar = AppElements.createImage(scale: .scaleAspectFill, corner: 22)
    lazy var userName = AppElements.createLabel(
        font: .systemFont(ofSize: 20, weight: .bold),
        textColor: .black,
        aligment: .left
    )
    lazy var imageView: UIImageView = {
        .config(view: $0) {imageView in
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
        }
    }(UIImageView())
    lazy var postCreationDate = AppElements.createLabel(
        font: .systemFont(ofSize: 14),
        textColor: .appTextGray,
        aligment: .left
    )
    lazy var title = AppElements.createLabel(
        font: .systemFont(ofSize: 22, weight: .bold),
        textColor: .black,
        aligment: .left
    )
    lazy var textTweat = AppElements.createLabel(font: .systemFont(ofSize: 16), textColor: .black, aligment: .left)
    
    func setupCell(item: Item) {
//        [userImageAvatar, userName, imageView, postCreationDate, title, textTweat].forEach {addSubview($0)}
        [userImageAvatar, userName, imageView, postCreationDate, title, textTweat].forEach {cellView.addSubview($0)}
        addSubview(cellView)
        
        userImageAvatar.image = UIImage(named: item.userAvatar)
        userName.text = item.userName
        imageView.image = UIImage(named: item.image)
        postCreationDate.text = item.postCreationDate
        title.text = item.title
        textTweat.text = item.text
        
        var imageRatio: CGFloat = 0
        
        if let image = imageView.image {
            imageRatio = image.size.height / image.size.width
        } else {
            imageView.image = UIImage(named: "gradient-no-photo-sign_23-2149263898")
            imageView.tintColor = .systemGray
            let defaultImage = UIImage(named: "gradient-no-photo-sign_23-2149263898")
            imageRatio = (defaultImage?.size.height ?? 1) / (defaultImage?.size.width ?? 1)
        }

        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.widthAnchor.constraint(equalToConstant: viewWidth - 60),
            textTweat.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            userImageAvatar.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
            userImageAvatar.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            userImageAvatar.widthAnchor.constraint(equalToConstant: 44),
            userImageAvatar.heightAnchor.constraint(equalToConstant: 44),
            
            userName.leadingAnchor.constraint(equalTo: userImageAvatar.trailingAnchor, constant: 20),
            userName.centerYAnchor.constraint(equalTo: userImageAvatar.centerYAnchor),
            userName.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            
            imageView.topAnchor.constraint(equalTo: userImageAvatar.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
//            imageView.widthAnchor.constraint(equalToConstant: viewWidth - 60),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: imageRatio),
            
            postCreationDate.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 9),
            postCreationDate.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            postCreationDate.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            
            title.topAnchor.constraint(equalTo: postCreationDate.bottomAnchor, constant: 4),
            title.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            
            textTweat.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            textTweat.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            textTweat.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            textTweat.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20)
        ])
    }
}

