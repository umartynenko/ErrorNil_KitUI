//
//  Item.swift
//  ErrorNil_UIKit_HW7
//
//  Created by Юрий Мартыненко on 17.04.2024.
//

import Foundation
import LoremSwiftum


struct Item: Identifiable {
    let id = UUID().uuidString
    let userName: String
    let iconImage: String
    let image: String
    let title: String
    let text: String
    
    static func content() -> [Item] {
        [
            Item(
                userName: "Casper Westera",
                iconImage: "profile-1713288570127-2684c8f90351image",
                image: "casper-westera-X_dMGH9vFng-unsplash",
                title: Lorem.title,
                text: Lorem.paragraph
            ),
            Item(
                userName: "Diana Krotova",
                iconImage: "pretty-woman-portrait-outdoor",
                image: "diana-krotova-VhjUJZoAMiY-unsplash",
                title: Lorem.title,
                text: Lorem.paragraph
            )
        ]
    }
}
