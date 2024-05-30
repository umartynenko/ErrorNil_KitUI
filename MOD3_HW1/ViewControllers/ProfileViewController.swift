//
//  ProfileViewController.swift
//  MOD3_HW1
//
//  Created by Юрий Мартыненко on 29.05.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    let singletonRegistration = SingletonRegistration.shared
    
    var userEmail = ""
    
    lazy var titleView = MyAppElements.createTitleLabel(
        text: "Мой профиль",
        size: 35,
        textColor: .white,
        alignment: .left
    )
    lazy var userImage = MyAppElements.createImageAvatar(
        imageName: "karsten-winegeart-50TGWi-XDlI-unsplash",
        width: 148,
        height: 148,
        cornerRadius: 74,
        contentMode: .scaleAspectFill,
        borderWidth: 3,
        borderColor: .white
    )
    lazy var userEmailTitle = MyAppElements.createTitleLabel(text: userEmail, size: 28, textColor: .white)
    lazy var myAccountButton = MyAppElements.createButtonImgText(
        title: "Мой аккаунт",
        systemImage: "person",
        tintColor: .white,
        backgroundColor: .buttonGray,
        cornerRadius: 5,
        fontSize: 14
    )
    lazy var settingsButton = MyAppElements.createButtonImgText(
        title: "Настройки",
        systemImage: "gearshape",
        tintColor: .white,
        backgroundColor: .buttonGray,
        cornerRadius: 5,
        fontSize: 14
    )
    lazy var helpButton = MyAppElements.createButtonImgText(
        title: "Помощь",
        systemImage: "message",
        tintColor: .white,
        backgroundColor: .buttonGray,
        cornerRadius: 5,
        fontSize: 14
    )
    lazy var exitButton = MyAppElements.createButton(title: "Выход", color: .buttonGray, corner: 5, colorTitle: .white)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        userEmail = self.singletonRegistration.emailUser ?? ""
        
        exitButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        
        [titleView, userImage, userEmailTitle, myAccountButton, settingsButton, helpButton, exitButton].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            userImage.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 130),
            userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImage.heightAnchor.constraint(equalToConstant: 148),
            userImage.widthAnchor.constraint(equalToConstant: 148),
            
            userEmailTitle.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 53),
            userEmailTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            userEmailTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            myAccountButton.topAnchor.constraint(equalTo: userEmailTitle.bottomAnchor, constant: 40),
            myAccountButton.widthAnchor.constraint(equalToConstant: 290),
            myAccountButton.heightAnchor.constraint(equalToConstant: 44),
            myAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            settingsButton.topAnchor.constraint(equalTo: myAccountButton.bottomAnchor, constant: 10),
            settingsButton.widthAnchor.constraint(equalToConstant: 290),
            settingsButton.heightAnchor.constraint(equalToConstant: 44),
            settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            helpButton.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 10),
            helpButton.widthAnchor.constraint(equalToConstant: 290),
            helpButton.heightAnchor.constraint(equalToConstant: 44),
            helpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            exitButton.topAnchor.constraint(equalTo: helpButton.bottomAnchor, constant: 150),
            exitButton.widthAnchor.constraint(equalToConstant: 290),
            exitButton.heightAnchor.constraint(equalToConstant: 44),
            exitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    
    @objc func exitButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(Notification(name: .setRoot, userInfo: ["vc": "registration"]))
    }

}
