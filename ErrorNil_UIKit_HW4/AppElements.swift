//
//  AppElements.swift
//  ErrorNil_UIKit_HW4
//
//  Created by Юрий Мартыненко on 07.04.2024.
//

import Foundation
import UIKit


class AppElements {
    static func createLabel(text: String, font: UIFont, size: CGSize, position: CGPoint, colot: UIColor) -> UILabel {
        {
            $0.text = text
            $0.font = font
            $0.frame.size = size
            $0.frame.origin = position
            $0.textColor = colot
            
            return $0
        }(UILabel())
    }
    
    static func createRoundButton(
        color: UIColor = .clear,
        logotip: String,
        corner: CGFloat,
        size: CGSize,
        position: CGPoint,
        logoTintColor: UIColor = .white,
        iconPadding: NSDirectionalEdgeInsets
    ) -> UIButton {
        let logo = {
            var logo = UIButton.Configuration.plain()
            logo.background.image = UIImage(named: logotip)?.withTintColor(logoTintColor)
            logo.background.backgroundInsets = iconPadding
            logo.image?.withTintColor(.white, renderingMode: .alwaysOriginal)

            return logo
        }()
        
        let button = UIButton(configuration: logo)
        button.backgroundColor = color
        button.frame.size = size
        button.layer.cornerRadius = corner
        button.frame.origin = position
        button.tintColor = .white

        return button
    }
}
