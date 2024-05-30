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
    
    static func createButton(setImage: String? = nil, title: String? = nil, color: UIColor = .black, titleAlignment: UIControl.ContentHorizontalAlignment = .center, action: UIAction, corner: CGFloat = 0) -> UIButton {
        {
            .config(view: $0) { setupButton in
                setupButton.setImage(UIImage(systemName: setImage ?? ""), for: .normal)
                setupButton.setTitle(title, for: .normal)
                setupButton.tintColor = color
                setupButton.contentHorizontalAlignment = titleAlignment
                setupButton.layer.cornerRadius = corner
            }
        }(UIButton(type: .system, primaryAction: action))
    }
    
    static func createCustomImage(corner: CGFloat) -> UIImageView {
        {
            .config(view: $0) { setupImage in
                setupImage.contentMode = .scaleAspectFill
                setupImage.clipsToBounds = true
                setupImage.layer.cornerRadius = corner
                setupImage.isUserInteractionEnabled = true
            }
        }(UIImageView())
    }
    
    static func resizeImage(image: UIImage, targetSize: CGFloat) -> UIImage {
        let size = image.size
        
        // Рассчитываем соотношение масштабирования для сохранения пропорций
        let widthRatio  = targetSize  / size.width
        let heightRatio = targetSize / size.height
        
        // Выбираем минимальное значение, чтобы убедиться, что изображение умещается в рамки
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Рассчитываем новый размер, учитывая масштабирование
        let scaledWidth  = size.width * scaleFactor
        let scaledHeight = size.height * scaleFactor
        
        // Создаем контекст для нового размера
        UIGraphicsBeginImageContextWithOptions(CGSize(width: scaledWidth, height: scaledHeight), false, 0.0)
        
        // Рисуем изображение в контексте с учетом нового размера
        image.draw(in: CGRect(x: 0, y: 0, width: scaledWidth, height: scaledHeight))
        
        // Извлекаем изображение из контекста
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // Закрываем контекст
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

class CustomNavigationController: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationBar.prefersLargeTitles = true // Enable large titles (optional)
    navigationBar.topItem?.title = "Your App Name" // Set title here
  }
}
