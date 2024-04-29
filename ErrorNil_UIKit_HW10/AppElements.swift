//
//  AppElements.swift
//  ErrorNil_UIKit_HW10
//
//  Created by Юрий Мартыненко on 29.04.2024.
//

import Foundation
import UIKit


class AppElements {
    static func createImage(corner: CGFloat, width: CGFloat) -> UIImageView {
        {
            .config(view: $0) {setupImage in
                setupImage.contentMode = .scaleAspectFill
                setupImage.layer.cornerRadius = corner
                setupImage.clipsToBounds = true
                setupImage.widthAnchor.constraint(equalToConstant: width).isActive = true
                setupImage.heightAnchor.constraint(equalTo: setupImage.widthAnchor).isActive = true
            }
        }(UIImageView())
    }
    
    static func createLabel(alignment: NSTextAlignment = .left) -> UILabel {
        {
            .config(view: $0) {setupNameLabel in
                setupNameLabel.textAlignment = alignment
                setupNameLabel.numberOfLines = 0
            }
        }(UILabel())
    }
}
