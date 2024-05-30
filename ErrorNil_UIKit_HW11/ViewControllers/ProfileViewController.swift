//
//  ProfileViewController.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 05.05.2024.
//

import UIKit
import LoremSwiftum


class ProfileViewController: UIViewController {
    let email = "kerry_rich@gmail.com"
    
    var telephone = "+7(904)888-88-88"
    
    lazy private var editUser = UIAction { [weak self] action in
        print("edit")
    }
    lazy var imageUser: UIImageView = AppElements.createImage(corner: 76)
    lazy var imageCustomUser: UIImageView = AppElements.createImage(corner: 0)
    lazy var userNameLabel: UILabel = AppElements.createLabel(fontSize: 22, fontWeight: .bold, color: .black, alignment: .center)
    lazy var telegramLabel: UILabel = AppElements.createLabel(fontSize: 14 , fontWeight: .regular, color: .appColorUserCellText, alignment: .center)    
    lazy var fullTelephone: UILabel = AppElements.createLabel(fontSize: 14 , fontWeight: .regular, color: .appColorUserCellText, alignment: .center)
    lazy var emailTitle: UILabel = AppElements.createLabel(fontSize: 14 , fontWeight: .regular, color: .appColorUserCellText, alignment: .center)
    lazy var userEditButton: UIButton = AppElements.createButton(title: "Редактировать",  color: .white, titleAlignment: .center, action: editUser, corner: 8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [imageUser, userNameLabel, telegramLabel, fullTelephone, emailTitle, userEditButton, imageCustomUser].forEach { view.addSubview($0) }
        
        imageUser.image = UIImage(named: "narissa-de-villiers-y1ObZTkoJHU-unsplash")
        userNameLabel.text = "Kerry Rich"
        telegramLabel.text = "@kerry_rich"
        fullTelephone.text = "Телефон: " + telephone
        emailTitle.text = "Email: " + email
        userEditButton.backgroundColor = .systemBlue
        imageCustomUser.image = AppElements.resizeImage(image: UIImage(named: "narissa-de-villiers-y1ObZTkoJHU-unsplash")!, targetSize: 100)
        
        
        
        NSLayoutConstraint.activate([
            imageUser.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageUser.widthAnchor.constraint(equalToConstant: 152),
            imageUser.heightAnchor.constraint(equalTo: imageUser.widthAnchor),
            imageUser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: imageUser.bottomAnchor, constant: 24),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            telegramLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
            telegramLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            telegramLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            fullTelephone.topAnchor.constraint(equalTo: telegramLabel.bottomAnchor, constant: 24),
            fullTelephone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fullTelephone.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            emailTitle.topAnchor.constraint(equalTo: fullTelephone.bottomAnchor, constant: 10),
            emailTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            userEditButton.topAnchor.constraint(equalTo: emailTitle.bottomAnchor, constant: 36),
            userEditButton.heightAnchor.constraint(equalToConstant: 40),
            userEditButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userEditButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            imageCustomUser.topAnchor.constraint(equalTo: userEditButton.bottomAnchor, constant: 20),
            imageCustomUser.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
