//
//  SectionCollections.swift
//  ErrorNil_UIKit_HW10
//
//  Created by Юрий Мартыненко on 29.04.2024.
//

import Foundation
import LoremSwiftum


struct SectionCollections: Identifiable {
    let id: String = UUID().uuidString
    let header: String
    let items: [ItemCollection]
    
    static func mockData() -> [SectionCollections] {
        let storyItems = [
            ItemCollection(image: "9126", name: Lorem.fullName),
            ItemCollection(image: "9655", name: Lorem.fullName),
            ItemCollection(image: "15662", name: Lorem.fullName),
            ItemCollection(image: "photo-delicious-hamburger-isolated-white-background_125540-3378", name: Lorem.fullName),
            ItemCollection(image: "shirt-mockup-concept-with-plain-clothing_23-2149448792", name: Lorem.fullName),
            ItemCollection(image: "snowy-mountain-peak-starry-galaxy-majesty-generative-ai_188544-9650",
                           name: Lorem.fullName),
            ItemCollection(image: "space-background-realistic-starry-night-cosmos-shining-stars-milky-way-stardust-color-galaxy_1258-154643",
                           name: Lorem.fullName),
        ]
        let messageItems = [
            ItemCollection(image: "abstract-plexus-blue-geometrical-shapes-connection-ai-generated-image_511042-596", 
                           text: Lorem.sentence),
            ItemCollection(image: "eid-al-fitr-greeting-with-lanterns-dark-blue-background_1123-294", text: Lorem.sentence),
            ItemCollection(image: "front-view-woman-posing-outdoors_23-2151047875", text: Lorem.sentence),
            ItemCollection(image: "indoor-plants-studio_23-2151022069", text: Lorem.sentence),
            ItemCollection(image: "luxurious-car-parked-highway-with-illuminated-headlight-sunset_181624-60607",
                           text: Lorem.sentence),
            ItemCollection(image: "niagara-falls_649448-3318", text: Lorem.sentence),
            ItemCollection(image: "plant-stucco-wall-background-zoom-calls_23-2149684466", text: Lorem.sentence),
            ItemCollection(image: "sky-clouds-cinematic-clouds-wallpaper-4_1562-741", text: Lorem.sentence),
            ItemCollection(image: "spring-landscape-with-tulips-daisies_123827-29597", text: Lorem.sentence),
            ItemCollection(image: "two-white-crumpled-posters-grunge-wall_125540-2576", text: Lorem.sentence),
            ItemCollection(image: "erinada-valpurgieva-txGgKTf9Aio-unsplash", text: Lorem.sentence),
            ItemCollection(image: "woman-showing-with-one-hand-mini-house-real-state-concept-ai-generative_123827-24098",
                           text: Lorem.sentence),
        ]
        let newsItems = [
            ItemCollection(image: "ahmed-Ep6WCCtJFRk-unsplash", header: Lorem.title, text: Lorem.sentence),
            ItemCollection(image: "lala-azizli-vVJn0k8v5vU-unsplash", header: Lorem.title, text: Lorem.sentence),
            ItemCollection(image: "art-institute-of-chicago-zNXMHFOf6yU-unsplash", header: Lorem.title, text: Lorem.sentence),
            ItemCollection(image: "daniel-lincoln-5AiN3pLyJLU-unsplash", header: Lorem.title, text: Lorem.sentence),
            ItemCollection(image: "austin-curtis-ZjYopWItB_I-unsplash", header: Lorem.title, text: Lorem.sentence),
            ItemCollection(image: "pawel-czerwinski-IWB5zcF6uLc-unsplash", header: Lorem.title, text: Lorem.sentence),
        ]
        let bannerItems = [
            ItemCollection(image: "dario-daniel-silva--edfmnxXaKQ-unsplash"),
            ItemCollection(image: "ellie-ellien-tJ9ZwimIGjc-unsplash"),
            ItemCollection(image: "gavin-wilson-tAAZqXh7CvM-unsplash"),
            ItemCollection(image: "musa-ortac-W6wfVyJ_Zzc-unsplash"),
            ItemCollection(image: "parker-coffman-IlUpkDzb7Xg-unsplash"),
        ]
        let storySection = SectionCollections(header: "Stories", items: storyItems)
        let messageSection = SectionCollections(header: "Messages", items: messageItems)
        let newsSection = SectionCollections(header: "News", items: newsItems)
        let bannerSection = SectionCollections(header: "Banners", items: bannerItems)
        
        return [storySection, messageSection, newsSection, bannerSection]
    }
}
