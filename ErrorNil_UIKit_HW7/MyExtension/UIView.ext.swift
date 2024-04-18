//
//  UIView.ext.swift
//  ErrorNil_UIKit_HW7
//
//  Created by Юрий Мартыненко on 18.04.2024.
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
 
