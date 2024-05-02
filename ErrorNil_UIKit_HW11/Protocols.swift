//
//  Protocols.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 02.05.2024.
//

import Foundation
import UIKit


protocol CellProtocol: AnyObject {
    static var reuseID: String {get}
    var imageView: UIImageView {get set}
    var text: UILabel {get set}
    
    func setupCell(item: ItemCollection)
}
