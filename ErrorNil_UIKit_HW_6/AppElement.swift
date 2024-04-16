//
//  AppElement.swift
//  ErrorNil_UIKit_HW_6
//
//  Created by Юрий Мартыненко on 14.04.2024.
//

import Foundation
import UIKit


class AppElement {
    static func createCell(name: String, frame: CGRect, corner: CGFloat = 30) -> UIImageView {
        {
            $0.frame = frame
            $0.image = UIImage(named: name)
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = corner
            $0.clipsToBounds = true
            $0.backgroundColor = .appGray
            
            
            return $0
        }(UIImageView())
    }
    
    static func userName(name: String, textAlignment: NSTextAlignment = .left, frame: CGRect, color: UIColor, fontSize: CGFloat = 20, weight: UIFont.Weight = .bold) -> UILabel {
        {
            $0.text = name
            $0.textAlignment = textAlignment
            $0.frame = frame
            $0.textColor = color
            $0.font = .systemFont(ofSize: fontSize, weight: weight)
    
            return $0
        }(UILabel())
    }
    
    static func userNameText(name: String, textAlignment: NSTextAlignment = .left, frame: CGRect, color: UIColor) -> UILabel {
        {
            $0.text = name
            $0.textAlignment = textAlignment
            $0.frame = frame
            $0.textColor = color
            $0.font = .systemFont(ofSize: 14, weight: .regular)
            $0.backgroundColor = .clear
            $0.numberOfLines = 4
    
            return $0
        }(UILabel())
    }
    
}
