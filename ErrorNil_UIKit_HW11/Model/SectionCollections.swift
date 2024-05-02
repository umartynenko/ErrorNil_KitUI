//
//  SectionCollections.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 01.05.2024.
//

import Foundation
import LoremSwiftum


struct SectionCollections: Identifiable {
    let id: String = UUID().uuidString
    let header: String
    let items: [ItemCollection]
    
    
    static func mocData() -> [SectionCollections] {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "dd MMMM yyyy"
        
        let now = NSDate()
        let formattedDate = formatter.string(from: now as Date)
        let newsItemss = [
            ItemCollection(
                image: "alex-shuper-U7MRVBu0raM-unsplash",
                text: Lorem.sentence,
                title: Lorem.title,
                date: formattedDate
            ),
            ItemCollection(
                image: "david-becker-P320vIz2sI0-unsplash",
                text: Lorem.sentence,
                title: Lorem.title,
                date: formattedDate
            ),
            ItemCollection(
                image: "osman-rana-yM3T1vYh8Oc-unsplash",
                text: Lorem.sentence,
                title: Lorem.title,
                date: formattedDate
            ),
            ItemCollection(
                image: "susan-wilkinson-W7BWVPhPqfw-unsplash",
                text: Lorem.sentence,
                title: Lorem.title,
                date: formattedDate
            ),
            ItemCollection(
                image: "wolfgang-hasselmann-Zq-N_hwsddM-unsplash",
                text: Lorem.sentence,
                title: Lorem.title,
                date: formattedDate
            ),
        ]
        let newsSection = SectionCollections(header: "News", items: newsItemss)
        
        return [newsSection]
    }
}
