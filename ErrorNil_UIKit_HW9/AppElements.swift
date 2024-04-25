//
//  AppElements.swift
//  ErrorNil_UIKit_HW9
//
//  Created by Юрий Мартыненко on 25.04.2024.
//

import Foundation
import UIKit


class AppElements {
    static func createLabel(
        font: UIFont = .systemFont(ofSize: 16,weight: .regular),
        textColor: UIColor,
        aligment: NSTextAlignment
    ) -> UILabel {
        {
            .config(view: $0) {label in
                label.numberOfLines = 0
                label.font = font
                label.textColor = textColor
                label.textAlignment = aligment
            }
        }(UILabel())
    }
    
    static func createImage(scale: UIView.ContentMode, clipsToBounds: Bool = true, corner: CGFloat = 0) -> UIImageView {
        {
            .config(view: $0) {imageView in
                imageView.contentMode = scale
                imageView.clipsToBounds = clipsToBounds
                imageView.layer.cornerRadius = corner
            }
        }(UIImageView())
    }
}
