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
    
    static func userName(name: String, frame: CGRect) -> UILabel {
        {
            $0.text = name
            $0.frame = frame
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 20, weight: .bold)
    
            return $0
        }(UILabel())
    }
    
    static func userNameText(name: String, frame: CGRect) -> UILabel {
        {
            $0.text = name
            $0.frame = frame
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 14, weight: .regular)
            $0.backgroundColor = .clear
            $0.numberOfLines = 4
    
            return $0
        }(UILabel())
    }
    
}
