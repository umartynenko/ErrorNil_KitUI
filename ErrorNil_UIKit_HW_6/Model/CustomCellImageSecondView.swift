//
//  CustomCellImageSecondView.swift
//  ErrorNil_UIKit_HW_6
//
//  Created by Юрий Мартыненко on 16.04.2024.
//

import Foundation


struct UserImage: Identifiable {
    let id: String = UUID().uuidString
    let image: String
}


func createUserMessageCell(userImage: [String]) -> [UserImage] {
    var cellImage: [UserImage] = []
    for image in userImage {
        cellImage.append(UserImage(image: image))
    }
    
    return cellImage
}
