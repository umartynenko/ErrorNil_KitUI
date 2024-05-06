//
//  ProfileViewController.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 05.05.2024.
//

import UIKit
import LoremSwiftum


class ProfileViewController: UIViewController {
    lazy private var editUser = UIAction { [weak self] action in
        print("edit")
    }
    lazy var imageUser: UIImageView = AppElements.createImage(corner: 76)
    lazy var userNameLabel: UILabel = AppElements.createLabel(fontSize: 22, fontWeight: .bold, color: .black, alignment: .center)
    lazy var telegramLabel: UILabel = AppElements.createLabel(fontSize: 14 , fontWeight: .regular, color: .appColorUserCellText, alignment: .center)    
    lazy var teleTitle: UILabel = AppElements.createLabel(fontSize: 14 , fontWeight: .regular, color: .appColorUserCellText, alignment: .center)
    lazy var telephone: UILabel = AppElements.createLabel(fontSize: 14 , fontWeight: .regular, color: .appColorUserCellText)
    lazy var emailTitle: UILabel = AppElements.createLabel(fontSize: 14 , fontWeight: .regular, color: .appColorUserCellText, alignment: .center)
    lazy var email: UILabel = AppElements.createLabel(fontSize: 14 , fontWeight: .regular, color: .appColorUserCellText)
    lazy var userEditButton: UIButton = AppElements.createButton(title: "Редактировать",  color: .white, titleAlignment: .center, action: editUser, corner: 8)
    
    lazy var hStackTele: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 5
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.addArrangedSubview(teleTitle)
        $0.addArrangedSubview(telephone)
        
        return $0
    }(UIStackView())
    
    lazy var hStackEmail: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 5
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.addArrangedSubview(emailTitle)
        $0.addArrangedSubview(email)
        
        return $0
    }(UIStackView())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [imageUser, userNameLabel, telegramLabel, hStackTele, hStackEmail, userEditButton].forEach { view.addSubview($0) }
        
        teleTitle.text = "Телефон:"
        telephone.text = "+7(904)888-88-88"
        imageUser.image = UIImage(named: "narissa-de-villiers-y1ObZTkoJHU-unsplash")
        userNameLabel.text = "Kerry Rich"
        telegramLabel.text = "@kerry_rich"
        emailTitle.text = "Email:"
        emailTitle.frame.size = .zero
        emailTitle.frame.origin = .zero
        email.text = "kerry_rich@gmail.com"
        userEditButton.backgroundColor = .systemBlue
        
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
            
            hStackTele.topAnchor.constraint(equalTo: telegramLabel.bottomAnchor, constant: 24),
            hStackTele.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            hStackTele.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            
            hStackEmail.topAnchor.constraint(equalTo: hStackTele.bottomAnchor, constant: 10),
            hStackEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            hStackEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            userEditButton.topAnchor.constraint(equalTo: hStackEmail.bottomAnchor, constant: 36),
            userEditButton.heightAnchor.constraint(equalToConstant: 40),
            userEditButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userEditButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
    }
}
