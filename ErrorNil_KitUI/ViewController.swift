//
//  ViewController.swift
//  ErrorNil_KitUI
//
//  Created by Юрий Мартыненко on 27.03.2024.
//

import UIKit


class ViewController: UIViewController {
    let name = "Юрий"
    let surname = "Мартыненко"
    let streamNumber = "iOS 7"
    let buttonAddData = UIButton()
    let buttonClearData = UIButton()
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleNameLabel = createTitleLabel(
            text: "Имя:",
            size: 16,
            color: .black,
            frame: CGRect(
                x: 51,
                y: 80,
                width: 87,
                height: 19
            )
        )
        let titleSurnameLabel = createTitleLabel(
            text: "Фамилия:",
            size: 16,
            color: .black,
            frame: CGRect(
                x: 51,
                y: 112,
                width: 145,
                height: 19
            )
        )
        let titleStreamNumberLabel = createTitleLabel(
            text: "Номер потока:",
            size: 16,
            color: .black,
            frame: CGRect(
                x: 51,
                y: 144,
                width: 160,
                height: 19
            )
        )
        let nameLabel = createTitleLabel(
            text: "",
            size: 16,
            color: .red,
            frame: CGRect(
                x: 92,
                y: 80,
                width: 87,
                height: 19
            )
        )
        let surnameLabel = createTitleLabel(
            text: "",
            size: 16,
            color: .red,
            frame: CGRect(
                x: 131,
                y: 112,
                width: 153,
                height: 19
            )
        )
        let streamNumberLabel = createTitleLabel(
            text: "",
            size: 16,
            color: .red,
            frame: CGRect(
                x: 169,
                y: 144,
                width: 160,
                height: 19
            )
        )
        
        func buttonAction(clear: Bool) -> UIAction {
            if clear {
                let action = UIAction { _ in
                    nameLabel.text = ""
                    surnameLabel.text = ""
                    streamNumberLabel.text = ""
                }
                return action
            } else {
                let action = UIAction { _ in
                    nameLabel.text = self.name
                    surnameLabel.text = self.surname
                    streamNumberLabel.text = self.streamNumber
                }
                return action
            }
        }
        
        let buttonAddData = createButton(
            title: "Добавить данные",
            backgroun: .black,
            frame: CGRect(
                x: 23,
                y: 730,
                width: 384,
                height: 69
            ),
            corner: 20
        )
        
        buttonAddData.addAction(buttonAction(clear: false), for: .touchUpInside)
        buttonAddData.addTarget(self, action: #selector(buttonPresed), for: .touchUpInside)
        
        let buttonClearData = createButton(
            title: "Очистить данные",
            backgroun: .white,
            frame: CGRect(
                x: 23,
                y: 801,
                width: 384,
                height: 69
            )
        )
        
        buttonClearData.addAction(buttonAction(clear: true), for: .touchUpInside)
        buttonClearData.setTitleColor(.blue, for: .normal)
        buttonClearData.setTitleColor(.gray, for: .highlighted)
        
        view.addSubview(titleNameLabel)
        view.addSubview(nameLabel)
        view.addSubview(titleSurnameLabel)
        view.addSubview(surnameLabel)
        view.addSubview(titleStreamNumberLabel)
        view.addSubview(streamNumberLabel)
        view.addSubview(buttonAddData)
        view.addSubview(buttonClearData)
        
    }
    
    
    @objc func buttonPresed() {
        buttonAddData.backgroundColor = .gray
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.buttonAddData.backgroundColor = .black
        }
    }
    
    
    private func createButton(title: String, backgroun: UIColor, frame: CGRect, corner: CGFloat = 0) -> UIButton{
        let button = UIButton()
        
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroun
        button.frame = frame
        button.layer.cornerRadius = corner
        
        return button
    }
    
    
    private func createTitleLabel(text: String, size: CGFloat, color: UIColor, frame: CGRect) -> UILabel {
        let titleLabel = UILabel()
        
        titleLabel.text = text
        titleLabel.frame = frame
        titleLabel.textColor = color
        titleLabel.font = .boldSystemFont(ofSize: size)
        
        return titleLabel
    }
}

