//
//  MyAppElements.swift
//  MOD3_HW1
//
//  Created by Юрий Мартыненко on 28.05.2024.
//

import UIKit


class MyAppElements {
    static func createTitleLabel(
        text: String,
        size: CGFloat,
        weight: UIFont.Weight = .regular,
        textColor: UIColor = .black,
        alignment: NSTextAlignment = .center
    ) -> UILabel {
        {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.text = text
            $0.font = .systemFont(ofSize: size, weight: weight)
            $0.textColor = textColor
            $0.textAlignment = alignment
            
            return $0
        }(UILabel())
    }
    
    static func createTextField(
        placeholder: String,
        secure: Bool = false,
        keyboardType: UIKeyboardType = .default,
        target: Any? = nil,
        action: Selector? = nil
    ) -> UITextField {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.clipsToBounds = true
            textField.layer.cornerRadius = 14
            textField.placeholder = placeholder
            textField.isSecureTextEntry = secure
            textField.keyboardType = keyboardType
            textField.backgroundColor = .white
            textField.borderStyle = .roundedRect
            
            if secure, let target = target, let action = action {
                let toggleButton = UIButton(type: .custom)
                toggleButton.setImage(UIImage(systemName: "eye"), for: .normal)
                toggleButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
                toggleButton.addTarget(target, action: action, for: .touchUpInside)
                toggleButton.tintColor = .gray
                
                let container = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
                toggleButton.center = CGPoint(
                    x: container.bounds.width - toggleButton.bounds.width / 2 - 10,
                    y: container.bounds.height / 2
                )
                container.addSubview(toggleButton)
                
                textField.rightView = container
                textField.rightViewMode = .always
            }
            
            return textField
        }
    
    static func createTextLabel(
        text: String,
        size: CGFloat,
        weight: UIFont.Weight = .regular,
        color: UIColor = .black
    ) -> UILabel {
        {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.text = text
            $0.font = .systemFont(ofSize: size, weight: weight)
            $0.textColor = color
            $0.numberOfLines = 0
            
            return $0
        }(UILabel())
    }
    
    static func createButton(title: String, color: UIColor, corner: CGFloat, colorTitle: UIColor = .black) -> UIButton {
        {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.setTitle(title, for: .normal)
            $0.tintColor = colorTitle
            $0.backgroundColor = color
            $0.clipsToBounds = true
            $0.layer.cornerRadius = corner
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            
            
            return $0
        }(UIButton())
    }
    
    static func createLinkButton(
        title: String,
        titleColor: UIColor = .blue,
        fontSize: CGFloat,
        weight: UIFont.Weight = .regular
    ) -> UIButton {
        {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.setTitle(title.uppercased(), for: .normal)
            $0.setTitleColor(titleColor, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: fontSize, weight: weight)
            $0.sizeToFit()
            
            return $0
        }(UIButton())
    }
    
    static func createHSView(alignment: UIStackView.Alignment,  distribution: UIStackView.Distribution) -> UIStackView {
        {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.axis = .horizontal
            $0.alignment = alignment
            $0.distribution = distribution
            $0.spacing = 10
            
            return $0
        }(UIStackView())
    }
    
    static func createImageAvatar(
        imageName: String,
        width: CGFloat,
        height: CGFloat,
        cornerRadius: CGFloat,
        contentMode: UIView.ContentMode,
        borderWidth: CGFloat,
        borderColor: UIColor
    ) -> UIImageView {
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = contentMode
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.frame.size = CGSize(width: width, height: height)
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = cornerRadius
            imageView.layer.borderWidth = borderWidth
            imageView.layer.borderColor = borderColor.cgColor
            return imageView
        }()
        
        return imageView
    }
    
    static func createButtonImgText(title: String, systemImage: String, tintColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat, fontSize: CGFloat) -> UIButton {
        {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.setTitle(title, for: .normal)
            $0.setImage(UIImage(systemName: systemImage), for: .normal)
            $0.tintColor = tintColor
            $0.setTitleColor(tintColor, for: .normal)
            $0.backgroundColor = backgroundColor
            $0.clipsToBounds = true
            $0.layer.cornerRadius = cornerRadius
            $0.titleLabel?.font = .systemFont(ofSize: fontSize)
            $0.contentHorizontalAlignment = .left
            $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
            $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 27, bottom: 0, right: 0)
            
            return $0
        }(UIButton())
    }
}
