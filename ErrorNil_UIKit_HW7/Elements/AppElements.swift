//
//  AppElements.swift
//  ErrorNil_UIKit_HW_7
//
//  Created by Юрий Мартыненко on 18.04.2024.
//

import Foundation
import UIKit


class AppElements {
    static func createLabel(text: String, fontSize: CGFloat, weight: UIFont.Weight, color: UIColor) -> UILabel {
        {
            .config(view: $0) {label in
                label.text = text
                label.font = .systemFont(ofSize: fontSize, weight: weight)
                label.textAlignment = .left
                label.textColor = color
            }
        }(UILabel())
    }
    
    static func createImage(name: String, corner: CGFloat) -> UIImageView {
        {
            .config(view: $0) {createImage in
                createImage.image = UIImage(named: name)
                createImage.contentMode = .scaleAspectFill
                createImage.layer.cornerRadius = corner
                createImage.clipsToBounds = true
            }
        }(UIImageView())
    }
}
