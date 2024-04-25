//
//  Item.swift
//  ErrorNil_UIKit_HW9
//
//  Created by Юрий Мартыненко on 25.04.2024.
//

import Foundation
import LoremSwiftum


struct Item: Identifiable {
    let id: String = UUID().uuidString
    let userAvatar: String
    let userName: String
    let image: String
    let postCreationDate: String
    let title: String
    let text: String
    
    static func mockData() -> [Item] {
        [
            Item(
                userAvatar: "profile-1685682927987-4a864bf15c6eimage",
                userName: "Cash Macanaya",
                image: "premium_photo-1712832296690-513c915baaa5",
                postCreationDate: "25 апреля 2024",
                title: Lorem.title,
                text: Lorem.tweet
            ),
            Item(
                userAvatar: "profile-1662553143053-d49a1961c9eaimage",
                userName: "Chalo Gallardo",
                image: "photo-1714016499569-bafb52342ebe",
                postCreationDate: "25 апреля 2024",
                title: Lorem.title,
                text: Lorem.tweet
            ),
            Item(
                userAvatar: "profile-1711531159098-7e0f33c59f6bimage",
                userName: Lorem.fullName,
                image: "",
                postCreationDate: "25 апреля 2024",
                title: Lorem.title,
                text: Lorem.tweet
            ),
            Item(
                userAvatar: "profile-1710233024230-b7947760f5f9image",
                userName: "HorseRat",
                image: "photo-1713781415289-4681f00cbd0e",
                postCreationDate: "25 апреля 2024",
                title: Lorem.title,
                text: Lorem.tweet
            ),
            Item(
                userAvatar: "profile-1701857665120-7b3efc31fe81image",
                userName: "Mattew Gave",
                image: "photo-1713783776085-ac641b9bc1f5",
                postCreationDate: "25 апреля 2024",
                title: Lorem.title,
                text: Lorem.tweet
            ),
            Item(
                userAvatar: "profile-1711531159098-7e0f33c59f6bimage",
                userName: "Xavier Demets",
                image: "photo-1713883394933-bf3469847af3",
                postCreationDate: "25 апреля 2024",
                title: Lorem.title,
                text: Lorem.tweet
            )
        ]
    }
}
