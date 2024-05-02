//
//  UIView.ext.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 02.05.2024.
//

import Foundation
import UIKit


extension UIView {
    static func config<T: UIView>(view: T, completion: (T) -> Void) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        completion(view)
        
        return view
    }
}