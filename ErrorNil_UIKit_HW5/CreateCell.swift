//
//  CreateCell.swift
//  ErrorNil_UIKit_HW5
//
//  Created by Юрий Мартыненко on 11.04.2024.
//

import Foundation
import UIKit
import LoremSwiftum


struct CellUser: Identifiable {
    let id: String = UUID().uuidString
    let userName: String
    var messages: [String]
    let image: String
}


func generatorUserName(gender: String) -> String {
    let malesNamesAndSurnames = ["Иван Кириллов", "Руслан Золотарев", "Марк Савицкий", "Игорь Колесников", "Михаил Панин", "Сергей Журавлев", "Илья Морозов", "Захар Климов", "Станислав Никонов", "Сергей Иванов", "Матвей Орлов", "Матвей Худяков", "Ярослав Родионов", "Иван Мельников", "Константин Федосеев", "Матвей Воробьев", "Матвей Егоров", "Матвей Иванов", "Игорь Дубровин", "Андрей Емельянов", "Александр Агафонов", "Евгений Орлов", "Матвей Давыдов", "Егор Шаповалов", "Александр Селиванов", "Марк Крылов", "Давид Емельянов", "Владислав Поляков", "Максим Смирнов", "Давид Минаев", "Артём Богданов", "Георгий Гуров", "Алексей Коршунов", "Егор Васильев", "Борис Горбачев", "Иван Алексеев", "Павел Филатов", "Максим Морозов", "Александр Коротков", "Сергей Калашников", "Кирилл Александров", "Кирилл Михайлов", "Иван Ильин", "Станислав Волков", "Константин Сафонов", "Иван Седов", "Марат Романов", "Арсений Казаков", "Елисей Блинов", "Никита Николаев", "Михаил Козлов", "Даниил Мальцев", "Егор Колесников", "Руслан Петухов", "Юрий Волков", "Леон Кондратов", "Всеволод Антонов", "Борис Соколов", "Александр Абрамов", "Иван Молчанов", "Николай Устинов", "Артём Чернов", "Никита Волков", "Александр Касьянов", "Ярослав Лебедев", "Константин Макаров", "Фёдор Куприянов", "Григорий Сергеев", "Михаил Васильев", "Евгений Архипов", "Даниил Панков", "Платон Калинин", "Андрей Орлов", "Кирилл Ситников", "Иван Колесников", "Максим Ефимов", "Степан Иванов", "Илья Воронов", "Михаил Сидоров", "Александр Анисимов", "Матвей Рубцов", "Артём Усов", "Артём Демидов", "Фёдор Макаров", "Александр Трофимов", "Дмитрий Ермаков", "Георгий Федоров", "Максим Артемов", "Ярослав Романов", "Кирилл Седов", "Ярослав Кочергин", "Дмитрий Чистяков", "Макар Белов", "Пётр Елисеев", "Никита Зайцев", "Максим Денисов", "Николай Кузнецов", "Мирослав Карпов", "Артём Дьяков", "Родион Минаев"]
    
    let womensNamesAndSurnames = ["Василиса Семенова","Анастасия Новикова", "Василиса Иванова", "Ника Николаева", "Майя Семенова", "Маргарита Лебедева", "Алина Чеботарева", "Виктория Степанова", "Ева Любимова", "Александра Котова", "Варвара Маркова", "Амалия Зубова", "Виктория Казакова", "Анастасия Зайцева", "Татьяна Белова", "Алиса Ушакова", "Варвара Егорова", "Мария Семенова", "Анастасия Смирнова", "Александра Масленникова", "Агния Рубцова", "Кира Иванова", "Алиса Матвеева", "Александра Герасимова", "Виктория Фролова", "Кира Фролова", "Дарина Туманова", "Вера Маслова", "Елена Сергеева", "Мария Казакова", "Амина Блинова", "Елена Соловьева", "Вероника Яковлева", "Варвара Николаева", "Ксения Круглова", "Виктория Майорова", "Анна Воронина", "Татьяна Казанцева", "Эвелина Яковлева", "Анна Соколова", "Анна Александрова", "Милана Романова", "Арина Кузнецова", "Елизавета Кузнецова", "Алиса Савина", "Мария Щукина", "Валерия Миронова", "Василиса Акимова", "Камила Орлова", "Аврора Архипова", "Дарья Трошина", "Зоя Бабушкина", "Дарья Иванова", "Стефания Лаптева", "Мария Наумова", "Дарья Гусева", "Алиса Виноградова", "Антонина Семенова", "Амелия Новикова", "Валерия Пименова", "Мария Спиридонова", "Анна Семенова", "Есения Зайцева", "Нина Белякова", "Елизавета Лукьянова","Марьям Иванова", "Елизавета Максимова", "Алиса Назарова", "Полина Сорокина", "Анна Романова", "Ольга Ковалева", "Арина Никитина", "Дарья Андреева", "Зоя Максимова", "Сафия Миронова", "Алиса Зотова", "Арина Соколова", "Анна Лазарева", "Милана Барсукова", "Арина Гришина", "Валерия Крылова", "Арина Фролова", "Вера Казанцева", "Ариана Кудрявцева", "Ева Попова", "Варвара Крылова", "Виктория Иванова", "Кира Козлова", "Ева Баженова", "Есения Елизарова", "София Голикова", "Василиса Молчанова", "Алиса Иванова", "Ирина Клюева", "Анна Панкратова", "Ольга Попова", "Александра Федорова", "Вера Бирюкова", "Алёна Власова", "Ольга Смирнова"]
    
    if gender == "man" {
        return malesNamesAndSurnames.randomElement()!
    } else {
        return womensNamesAndSurnames.randomElement()!
    }
}


func genetaroImage(gender: String) -> String {
    let maleImage = ["businessman-calling_23-2147996560", "close-up-handsome-man-with-green-eyes_1140-254", "close-up-man-making-peace-sign-smile_23-2148283885", "close-up-portrait-man-looking-camera-outdoors_23-2148283854", "close-up-smiley-man-posing_23-2148563418", "close-up-smiling-man-field-sunset_1140-222", "close-up-young-businessman-holding-disposable-coffee-cup-hand-looking-camera_23-2148176166", "crazy-man-looking-camera_23-2147808150", "cute-man-outdoor_144627-14323", "front-view-smiley-man-outdoors_23-2148612976", "front-view-smiley-man-posing-outdoors_23-2148612950", "front-view-smiley-man-posing-outdoors_23-2148612987" ,"front-view-smiley-man-with-sunglasses-city_23-2148682678", "handsome-man_144627-14268", "handsome-man-planning-redecorate-house-using-paint-palette_23-2148814586", "handsome-man-sweater_144627-11528", "man-posing-outdoors-while-having-coffee-listening-music-earphones_23-2148682647", "man-wearing-red-bow-tie-party-hat-looking-bliss_1298-252", "medium-shot-guy-with-headphones-hand-his-pocket_23-2148329006", "medium-shot-man-with-phone-earphones_23-2148781064", "medium-shot-smiley-boy-posing-with-sunglasses_23-2148984770", "medium-shot-stylish-man-posing_23-2148895163", "non-binary-person-modern-clothes-posing-outdoors_23-2148760572", "photographer-focusing-camera_23-2147654188", "portrait-adult-man-smiling_23-2148531014", "portrait-cheerful-photographer-studio_158595-501", "portrait-confident-male-electrician-standing-against-wall_23-2148087578", "portrait-employee-happy-be-back-work_23-2148727615", "portrait-fashion-young-man_158595-1735", "portrait-interesting-young-man-winter-clothes_158595-911", "portrait-man-artist-talking-phone_23-2148422177", "portrait-modern-man_23-2147960990", "portrait-modern-man_23-2147961425", "portrait-shy-fashionable-boy_23-2148184587", "portrait-smiley-businessman_23-2148746289", "portrait-smiling-charming-young-man-grey-t-shirt-standing-against-plain-background_23-2148213406", "portrait-smiling-happy-young-man-isolated-white_186202-6708", "portrait-smiling-happy-young-man-isolated-white_186202-6709", "portrait-teenage-boy_23-2148478662", "portrait-young-handsome-man-white-shirt-poses-wall-with-contrast-shadows_186202-8962", "portrait-young-man-yellow-scene_23-2148184706", "serious-man-looking-camera_23-2147799044", "smiley-businessman-with-tablet_23-2147641286", "smiley-handsome-man-posing_23-2148911841", "young-handsome-man-curtain-yellow-scene_23-2148184670", "young-man-wearing-blue-outfit-blinking-eye_1298-120", "young-man-wearing-blue-outfit-doing-holding-gesture_1298-125", "young-man-wearing-blue-outfit-holding-red-cup_1298-174", "young-man-wearing-blue-outfit-looking-confident_1298-291", "young-man-wearing-blue-outfit-looking-tired_1298-106"]
    
    let womenImage = ["beautiful-woman-office_144627-8484", "beautiful-woman-smiling-with-flower-hair_23-2148072147", "blonde-woman-blowing-kiss_23-2148619427", "blonde-woman-staying-outside_23-2148378591", "brunette-girl-posing_23-2148108748", "close-up-pretty-girl-looking-camera_23-2148311300", "close-up-redheaded-woman-wearing-scarf_1140-302", "close-up-smiley-woman-wearing-hat_23-2148962707", "close-up-smiley-woman-with-hat_23-2148962721", "confident-young-woman-with-her-arms-crossed-looking-away_23-2148130373", "elegant-businesswoman-walking-city_23-2147989690", "elegant-businesswoman-with-arms-crossed_23-2147989671", "elegant-young-woman-red-wear_23-2148068407", "front-view-alluring-older-business-woman-posing_23-2148661221", "front-view-beautiful-modern-woman-concept_23-2148342432", "front-view-beautiful-pregnant-woman-home_23-2148765052", "front-view-beautiful-woman_23-2148574859", "front-view-beautiful-woman-floral-dress_23-2148357672", "front-view-business-woman-suit_23-2148603018", "front-view-confident-woman_23-2148376549", "front-view-female-seaside_23-2148523914", "front-view-female-technician-posing-with-safety-glasses_23-2148816368", "front-view-smiley-business-woman_23-2148603016", "front-view-smiley-business-woman-with-sunglasses_23-2148603032", "front-view-smiley-woman-taking-pictures_23-2148375066", "front-view-woman-with-camera_23-2148523961", "little-girl-smiling-while-holding-her-hat_23-2148260143", "medium-shot-woman-wearing-hat_23-2149003018", "portrait-beautiful-woman-christmas_23-2148723602", "portrait-beautiful-woman-winter-trip_23-2148375097", "portrait-beautiful-young-adult-white-serious-woman-with-crossed-arms-white-wall_186202-7734", "portrait-blonde-girl-looking-photographer_23-2148348997", "portrait-cute-smiley-woman_23-2148728645", "portrait-non-binary-person_23-2148757593", "portrait-woman-taking-photos_23-2148523902", "portrait-woman-with-camera_23-2148523903", "portrait-woman-with-curly-hair_23-2148728586", "portrait-young-woman-with-sunglasses-her-head-holding-camera_23-2147910641", "pretty-ginger-young-woman-looking-away_23-2148183422", "side-view-woman-drinking-hot-tea_23-2148375085", "smiley-woman-holding-camera-leaf_23-2148647672", "smiley-woman-holding-cup-coffee-while-sitting-bench_23-2148728647", "smiley-woman-outdoors-city_23-2148774316", "smiling-happy-young-woman-outdoor_624325-1165", "smiling-woman-near-wall-holding-face_23-2147910849", "toothy-smiling-woman-looking-camera-kitchen_23-2148113950", "urban-portrait-brunette-woman_23-2148728638", "woman-farmer-relaxing-fence_23-2148568625", "young-woman-with-red-hair-arms-crossed-smiling_23-2148222621", "young-woman-with-round-glasses-yellow-sweater_273609-6019"]
    
    if gender == "man" {
        return maleImage.randomElement()!
    } else {
        return womenImage.randomElement()!
    }
}


func generatorCellUser() -> [[CellUser]] {
    var cellUser: [[CellUser]] = []
    
    for _ in 1...2 {
        var users: [CellUser] = []
        for _ in 1...Int.random(in: 1...10) {
            let gender = ["man", "woman"].randomElement()!
            users.append(CellUser(userName: generatorUserName(gender: gender), messages: generatorNotes(count: Int.random(in: 1...30)), image: genetaroImage(gender: gender)))
        }
        cellUser.append(users)
    }
    
    
    return cellUser
}

func generatorNotes(count: Int) -> [String] {
    var notes: [String] = []
    
    for _ in 1...count {
        notes.append(Lorem.sentence)
    }
    
    return notes
}


struct UserMassages: Identifiable {
    let id: String = UUID().uuidString
    let userName: String
    var message: String
    let image: String
}


func createUserMessageCell(userName: String, userMassages: [String], userImage: String) -> [UserMassages] {
    var cellMessage: [UserMassages] = []
    for message in userMassages {
        cellMessage.append(UserMassages(userName: userName, message: message, image: userImage))
    }
    return cellMessage
}
