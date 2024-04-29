//
//  Protocols.swift
//  ErrorNil_UIKit_HW10
//
//  Created by Юрий Мартыненко on 29.04.2024.
//

import Foundation
import UIKit


protocol CellProtocol: AnyObject {
    static var reuseID: String {get}
    var imageView: UIImageView {get set}
    
    func setupCell(item: ItemCollection)
}
