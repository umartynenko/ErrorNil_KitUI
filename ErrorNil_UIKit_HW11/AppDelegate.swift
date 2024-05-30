//
//  AppDelegate.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 01.05.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        // Рассчитываем соотношение масштабирования для сохранения пропорций
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Выбираем минимальное значение, чтобы убедиться, что изображение умещается в рамки
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Рассчитываем новый размер, учитывая масштабирование
        let scaledWidth  = size.width * scaleFactor
        let scaledHeight = size.height * scaleFactor
        
        // Создаем контекст для нового размера
        UIGraphicsBeginImageContextWithOptions(CGSize(width: scaledWidth, height: scaledHeight), false, 0.0)
        
        // Рисуем изображение в контексте с учетом нового размера
        image.draw(in: CGRect(x: 0, y: 0, width: scaledWidth, height: scaledHeight))
        
        // Извлекаем изображение из контекста
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // Закрываем контекст
        UIGraphicsEndImageContext()
        
        return newImage!
    }

}

