//
//  ViewController.swift
//  ErrorNil_UIKit_HW3
//
//  Created by Юрий Мартыненко on 04.04.2024.
//

import UIKit


protocol ViewControllerDelegate: AnyObject {
    func setFullName(firstName: String, lastName: String, about: String)
}


class ViewController: UIViewController {
    
    var aboutText = ""
    
    lazy var userUIView: UIView = {
        $0.frame.size = CGSize(width: view.frame.width - 60, height: 110)
        $0.center.x = view.center.x
        $0.frame.origin.y = 110
        $0.backgroundColor = .appGray
        $0.layer.cornerRadius = 30

        return $0
    }(UIView())
    lazy var userAvatarImage = AppElements.avatarImage(
        imageName: "a339940abd3883404a496de92e27fbd0",
        scale: .scaleAspectFill,
        sizeWidgt: 75,
        sizeHeight: 75,
        position: CGPoint(x: 17, y: 17),
        corner: 20
    )
    lazy var userNameLabel = AppElements.createLabel(
        text: "Имя Фамилия",
        textAligmet: .left,
        position: CGPoint(x: userAvatarImage.frame.maxX + 12, y: userAvatarImage.frame.minY + 11),
        size: CGSize(width: userUIView.frame.width - 155, height: 19),
        fontSize: 16,
        fontColot: .black
    )
    lazy var arrowButton: UIButton = {
        $0.frame.size = CGSize(width: 17, height: 17)
        $0.frame.origin = CGPoint(x: userUIView.frame.maxX - 68, y: userAvatarImage.frame.height - 32)
        $0.setImage(UIImage(named: "668c09547da8d0925994559d56f11e1b"), for: .normal)
        $0.tintColor = .black
        
        return $0
    }(UIButton(primaryAction: UIAction {[weak self] _ in
        let aboutVC = AboutUserViewController()
        aboutVC.fullName = self?.userNameLabel.text ?? ""
        aboutVC.about = self?.aboutText ?? ""
        self?.navigationController?.pushViewController(aboutVC, animated: true)
    }))
    lazy var editButton = AppElements.createButton(
        title: "Редактировать",
        fontSize: 14,
        fontColot: .white,
        color: .systemBlue,
        corner: 10,
        size: CGSize(
            width: 147,
            height: 30
        ),
        buttonPosition: CGPoint(x: userAvatarImage.frame.maxX + 12, y: userNameLabel.frame.maxY + 7),
        btnAction: UIAction {[weak self] _ in
            let settingsVC = SettingsViewController()
            settingsVC.delegate = self
            self?.navigationController?.pushViewController(settingsVC, animated: true)
        }
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [userAvatarImage, userNameLabel, arrowButton, editButton].forEach {userUIView.addSubview($0)}
        
        [userUIView].forEach {view.addSubview($0)}
        
        title = "Главная"
        view.backgroundColor = .white
    }
}


extension ViewController: ViewControllerDelegate {
    func setFullName(firstName: String, lastName: String, about: String) {
        self.userNameLabel.text = firstName + " " + lastName
        aboutText = about
    }
}

