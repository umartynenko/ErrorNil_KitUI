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
        let newsItems = [
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
        let eventsItems = [
            ItemCollection(image: "14916", text: Lorem.sentence),
            ItemCollection(image: "vector-isolated-realistic-soccer-ball-white_1284-41932", text: Lorem.sentence),
            ItemCollection(image: "green-leaves-vector_78370-661", text: Lorem.sentence),
            ItemCollection(image: "basketball-ball-isolated_1284-42545", text: Lorem.sentence),
            ItemCollection(image: "bird-colorful-logo-gradient-vector_343694-1365", text: Lorem.sentence),
            ItemCollection(image: "birthday-cap-with-confetti-serpentine-explosion_1017-17924", text: Lorem.sentence),
            ItemCollection(image: "creative-barbecue-logo-template_23-2149017951", text: Lorem.sentence),
            ItemCollection(image: "hand-drawn-flat-design-stack-books_23-2149334862", text: Lorem.sentence),
            ItemCollection(image: "hand-drawn-human-brain_53876-15740", text: Lorem.sentence),
            ItemCollection(image: "hand-drawn-oak-tree-silhouette_23-2150456954", text: Lorem.sentence),
            ItemCollection(image: "water-bubbles-background-with-text-space_1017-32342", text: Lorem.sentence),
            ItemCollection(image: "celebratory-balloons-isolated-background_1284-52282", text: Lorem.sentence),
            ItemCollection(image: "hand-painted-sun_23-2147510442", text: Lorem.sentence),
            ItemCollection(image: "pink-calligraphy-heart_78370-4375", text: Lorem.sentence),
            ItemCollection(image: "start_53876-25533", text: Lorem.sentence),
        ]
        let usersItems = [
            ItemCollection(image: "aedrian-o-hsk316GO4-unsplash", text: Lorem.sentence, userName: Lorem.fullName),
            ItemCollection(image: "clay-banks-WFpmfjXWIO4-unsplash", text: Lorem.sentence, userName: Lorem.fullName),
            ItemCollection(image: "job-savelsberg-FyLS_nQF5Eg-unsplash", text: Lorem.sentence, userName: Lorem.fullName),
            ItemCollection(image: "kristaps-ungurs--o-cJHQf4Gg-unsplash", text: Lorem.sentence, userName: Lorem.fullName),
            ItemCollection(image: "kristaps-ungurs-MgfD_22Hfj8-unsplash", text: Lorem.sentence, userName: Lorem.fullName),
            ItemCollection(image: "point-normal-mLFyaVdRdpE-unsplash", text: Lorem.sentence, userName: Lorem.fullName),
        ]
        let newsSection = SectionCollections(header: "Новости", items: newsItems)
        let eventsSection = SectionCollections(header: "События", items: eventsItems)
        let usersSection = SectionCollections(header: "Пользователи", items: usersItems)
        
        return [newsSection, eventsSection, usersSection]
    }
}
