//
//  ItemCollection.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 01.05.2024.
//

import Foundation


struct ItemCollection: Identifiable {
    let id: String = UUID().uuidString
    let image: String
    let text: String
    
    var userName: String? = nil
    var title: String? = nil
    var date: String? = nil
}
