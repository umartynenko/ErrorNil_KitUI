//
//  AppElements.swift
//  ErrorNil_UIKit_HW3
//
//  Created by Юрий Мартыненко on 05.04.2024.
//

import UIKit


class AppElements {
    static func createButton(
        title: String,
        fontSize: CGFloat,
        fontColot: UIColor,
        color: UIColor,
        corner: CGFloat,
        size: CGSize,
        buttonPosition: CGPoint,
        btnAction: UIAction
    ) -> UIButton {
        {
            $0.setTitle(title, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: fontSize)
            $0.setTitleColor(fontColot, for: .normal)
            $0.backgroundColor = color
            $0.layer.cornerRadius = corner
            $0.frame.size = size
            $0.frame.origin = buttonPosition
            $0.addAction(btnAction, for: .touchUpInside)
            
            return $0
        }(UIButton())
    }
    
    static func createTextLabel(
        text: String,
        fontSize: CGFloat,
        position: CGPoint = CGPoint(x: 0, y: 0),
        size: CGSize = CGSize(width: 0, height: 0)
    ) ->UILabel {
        {
            $0.text = text
            $0.font = .systemFont(ofSize: fontSize)
            $0.frame.origin = position
            $0.frame.size = size
            
            return $0
        }(UILabel())
    }
    
    static func createTextField(
        color: UIColor,
        corner: CGFloat,
        size: CGSize = CGSize(width: 0, height: 0),
        position: CGPoint = CGPoint(x: 0, y: 0),
        isEditing: Bool = true
    ) -> UITextField {
        {
            $0.backgroundColor = color
            $0.layer.cornerRadius = corner
            $0.frame.size = size
            $0.frame.origin = position
            $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
            $0.leftViewMode = .always
            $0.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
            $0.rightViewMode = .always
            
            return $0
        }(UITextField())
    }
    
    static func avatarImage(
        imageName: String,
        scale: UIView.ContentMode,
        sizeWidgt: CGFloat,
        sizeHeight: CGFloat,
        position: CGPoint,
        centerX: CGFloat = 0,
        corner: CGFloat
    ) -> UIImageView {
        {
            $0.image = UIImage(named: imageName)
            $0.contentMode = scale
            $0.frame.size = CGSize(width: sizeWidgt, height: sizeHeight)
            if centerX == 0 {
                $0.frame.origin = position
            } else {
                $0.frame.origin = CGPoint(x: centerX - (sizeHeight / 2), y: 95)
            }
            $0.clipsToBounds = true
            $0.layer.cornerRadius = corner
            
            return $0
        }(UIImageView())
    }
    
    static func createLabel(
        text: String,
        textAligmet:  NSTextAlignment,
        position: CGPoint,
        size: CGSize,
        fontSize: CGFloat,
        fontColot: UIColor
    ) -> UILabel {
        {
            $0.text = text
            $0.frame.origin = position
            $0.frame.size = size
            $0.font = .boldSystemFont(ofSize: fontSize)
            $0.textColor = fontColot
            $0.textAlignment = textAligmet
            
            return $0
        }(UILabel())
    }
}
