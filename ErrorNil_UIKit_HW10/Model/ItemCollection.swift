//
//  ItemCollection.swift
//  ErrorNil_UIKit_HW10
//
//  Created by Юрий Мартыненко on 29.04.2024.
//

import Foundation


struct ItemCollection: Identifiable {
    let id: String = UUID().uuidString
    let image: String
    var header: String? = nil
    var name: String? = nil
    var text: String? = nil
}
