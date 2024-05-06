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
                setupImage.isUserInteractionEnabled = true
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
    
    static func createButton(setImage: String? = nil, title: String? = nil, color: UIColor = .black, titleAlignment: UIControl.ContentHorizontalAlignment = .center, action: UIAction) -> UIButton {
        {
            .config(view: $0) { setupButton in
                setupButton.setImage(UIImage(systemName: setImage ?? ""), for: .normal)
                setupButton.setTitle(title, for: .normal)
                setupButton.tintColor = color
                setupButton.contentHorizontalAlignment = titleAlignment
            }
        }(UIButton(type: .system, primaryAction: action))
    }
}

class CustomNavigationController: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationBar.prefersLargeTitles = true // Enable large titles (optional)
    navigationBar.topItem?.title = "Your App Name" // Set title here
  }
}
