//
//  CustomCellFirstView.swift
//  ErrorNil_UIKit_HW_6
//
//  Created by Юрий Мартыненко on 14.04.2024.
//

import Foundation


struct CustomCellFirstView: Identifiable {
    let id = UUID().uuidString
    let title: String
    let iamge: [String]
    let message: String
    
    static func appData() -> [CustomCellFirstView] {
        [
            CustomCellFirstView(
                title: "Daniela Cuevas",
                iamge: [
                    "cute-young-girl-preparing-marshmallow_23-2148316074",
                    "adult-caucasian-male-hiker-standing-hill-sunset-lithuania",
                    "man-skateboarder-riding-empty-highway-road-with-amazing-hills",
                    "young-friends-together-outdoors"
                ],
                message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In aliquam sapien diam, non condimentum leo ullamcorper vel. Maecenas id fermentum augue, vitae malesuada nibh."
            ),
            CustomCellFirstView(
                title: "Christopher Ruel",
                iamge: [
                    "retro-tags_23-2147796060",
                    "beautiful-mountains-hills-shot-black-white_181624-397",
                    "shallow-focus-person-wearing-raincoat-with-backpack-surrounded-by-trees-rain_181624-45658",
                    "woman-enjoying-sunset-nature_23-2148579601"
                ],
                message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In aliquam sapien diam, non condimentum leo ullamcorper vel. Maecenas id fermentum augue, vitae malesuada nibh."
            ),
            CustomCellFirstView(
                title: "Javier Patiño Loira",
                iamge: [
                    "javier-patino-loira-BgA6hzSkTbE-unsplash",
                    "javier-patino-loira-h7O8eLKeKU8-unsplash",
                    "javier-patino-loira-L01SySkdHJQ-unsplash",
                    "javier-patino-loira-MULXuwjil6w-unsplash"
                ],
                message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In aliquam sapien diam, non condimentum leo ullamcorper vel. Maecenas id fermentum augue, vitae malesuada nibh."
            )
        ]
    }
}
