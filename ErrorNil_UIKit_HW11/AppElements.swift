//
//  AppElements.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 02.05.2024.
//

import Foundation
import UIKit


class AppElements {
    static func createImage(corner: CGFloat) -> UIImageView {
        {
            .config(view: $0) { setupImage in
                setupImage.contentMode = .scaleAspectFill
                setupImage.clipsToBounds = true
                setupImage.layer.cornerRadius = corner
            }
        }(UIImageView())
    }
    
    static func createLabel(
        lines: Int = 0,
        fontSize: CGFloat = 14,
        fontWeight: UIFont.Weight = .regular,
        color: UIColor = .white,
        alignment: NSTextAlignment = .left
    ) -> UILabel {
        {
            .config(view: $0) { setupLabel in
                setupLabel.numberOfLines = lines
                setupLabel.font = .systemFont(ofSize: fontSize, weight: fontWeight)
                setupLabel.textColor = color
                setupLabel.textAlignment = alignment
            }
        }(UILabel())
    }
}
