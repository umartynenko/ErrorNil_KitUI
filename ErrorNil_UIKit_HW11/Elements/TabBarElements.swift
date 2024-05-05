//
//  TabBarElements.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 05.05.2024.
//

import Foundation
import UIKit


class TabBarElements {
    static func createtabBarVC(viewController: UIViewController, tabBarTitle: String? = nil, imageElement: String? = nil, selectedImageElement: String? = nil) -> UIViewController {
        let vc = viewController
        vc.title = tabBarTitle
        vc.tabBarItem.image = UIImage(systemName: imageElement ?? "")
        vc.tabBarItem.selectedImage = UIImage(systemName: selectedImageElement ?? "")
        
        return vc
    }
}
