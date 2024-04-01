//
//  ViewController.swift
//  ErrorNil_UIKit_HW_2
//
//  Created by Юрий Мартыненко on 01.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    

    lazy var headerImage: UIImageView = {
        $0.image = UIImage(named: "89355b8ad2b6c7e4c6d18da47f89dc3f")
        
        return $0
    }(UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 430, height: 156))))
    
    lazy var avatarImage: UIImageView = {
        $0.image = UIImage(named: "0e721ea4574d531cbf697c7b95224254")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 50

        return $0
    }(UIImageView(frame: CGRect(origin: CGPoint(x: 30, y: 189), size: CGSize(width: 100, height: 100))))
    
    lazy var nameLabel = createLabel(frame: CGRect(x: 146, y: 208, width: 200, height: 19), text: "Мартыненко Юрий")
    lazy var editButton = createButton(frame: CGRect(x: 146, y: 236, width: 147, height: 34), title: "Редактировать", backgroundColor: .systemBlue, corner: 10)
    lazy var addTextLable = createLabel(frame: CGRect(x: 30, y: 341, width: 200, height: 19), text: "Добавить описание")
    lazy var textView: UITextView = {
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.systemBlue.cgColor
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return $0
    }(UITextView(frame: CGRect(x: 30, y: 369, width: view.frame.width - 60, height: 150)))
    lazy var passLabel = createLabel(frame: CGRect(x: 30, y: 552, width: 200, height: 19), text: "Изменить пароль")
    lazy var oldPasswordField = createTextField(
        frame: CGRect(
            x: 30,
            y: 580,
            width: view.frame.width - 60,
            height: 52
        ),
        placeholderText: "Старый пароль",
        backgroundColor: .white,
        corner: 10,
        isSecureText: true
    )
    lazy var newPasswordField = createTextField(
        frame: CGRect(
            x: 30,
            y: 646,
            width: view.frame.width - 60,
            height: 52
        ),
        placeholderText: "Новый пароль",
        backgroundColor: .white,
        corner: 10,
        isSecureText: true
    )
    lazy var saveButton = createButton(
        frame: CGRect(
            x: 30,
            y: view.frame.height - 107,
            width: view.frame.width - 60,
            height: 55
        ),
        title: "Сохранить",
        backgroundColor: .systemBlue,
        corner: 10
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [
            passLabel,
            nameLabel,
            editButton,
            oldPasswordField,
            newPasswordField,
            headerImage,
            saveButton,
            avatarImage,
            addTextLable,
            textView
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func createLabel(frame: CGRect, text: String) -> UILabel {
        let label = UILabel()
        label.frame = frame
        label.text = text
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }
    
    private func createButton(frame: CGRect, title: String, backgroundColor: UIColor, corner: CGFloat) -> UIButton {
        let button = UIButton()
        button.frame = frame
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = corner
        button.titleLabel?.font = .systemFont(ofSize: 14)
        
        return button
    }

    private func createTextField(
        frame: CGRect,
        placeholderText: String,
        backgroundColor: UIColor,
        corner: CGFloat = 0,
        isSecureText: Bool = false
    ) -> UITextField {
        let textField = UITextField()
        textField.frame = frame
        textField.placeholder = placeholderText
        textField.backgroundColor = backgroundColor
        textField.layer.cornerRadius = corner
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.isSecureTextEntry = isSecureText
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        textField.leftViewMode = .always
        
        return textField
    }
}

