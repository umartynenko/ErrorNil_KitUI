//
//  SettingsViewController.swift
//  ErrorNil_UIKit_HW3
//
//  Created by Юрий Мартыненко on 05.04.2024.
//

import UIKit

class SettingsViewController: UIViewController {
    
    weak var delegate: ViewControllerDelegate?
    
    lazy var nameLabel = AppElements.createTextLabel(
        text: "Имя",
        fontSize: 16,
        position: CGPoint(x: 42, y: 97),
        size: CGSize(width: view.frame.width - 84, height: 19)
    )
    lazy var nameTextField = AppElements.createTextField(
        color: .appGray,
        corner: 15,
        size: CGSize(width: view.frame.width - 60, height: 51),
        position: CGPoint(x: 30, y: nameLabel.frame.maxY + 5)
    )
    lazy var surnameLabel = AppElements.createTextLabel(
        text: "Фамилия",
        fontSize: 16,
        position: CGPoint(x: 42, y: nameTextField.frame.maxY + 22),
        size: CGSize(width: view.frame.width - 84, height: 19)
    )
    lazy var surnameTextField = AppElements.createTextField(
        color: .appGray,
        corner: 15,
        size: CGSize(width: view.frame.width - 60, height: 51),
        position: CGPoint(x: 30, y: surnameLabel.frame.maxY + 5)
    )
    lazy var descriptionLabel = AppElements.createTextLabel(
        text: "Описание",
        fontSize: 16,
        position: CGPoint(x: 30, y: surnameTextField.frame.maxY + 22),
        size: CGSize(width: view.frame.width - 60, height: 19)
    )
    lazy var descriptionTextView: UITextView = {
        $0.backgroundColor = .appGray
        $0.layer.cornerRadius = 15
        $0.frame.size = CGSize(width: view.frame.width - 60, height: 144)
        $0.frame.origin = CGPoint(x: 30, y: descriptionLabel.frame.maxY + 5)
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return $0
    }(UITextView())
    lazy var saveButton = AppElements.createButton(title: "Сохранить",
                                                   fontSize: 16,
                                                   fontColot: .white,
                                                   color: .systemBlue,
                                                   corner: 30,
                                                   size: CGSize(width: view.frame.width - 60, height: 60),
                                                   buttonPosition: CGPoint(x: 30, y: view.frame.maxY - 133),
                                                   btnAction: UIAction {
        [weak self] _ in
        
        self?.delegate?.setFullName(
            firstName: self?.nameTextField.text ?? "",
            lastName: self?.surnameTextField.text ?? "",
            about: self?.descriptionTextView.text ?? ""
        )
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
        view.backgroundColor = .white
        
        [
            nameLabel,
            nameTextField,
            surnameLabel,
            surnameTextField,
            descriptionLabel,
            descriptionTextView,
            saveButton
        ].forEach {
            view.addSubview(
                $0
            )
        }
    }
}
