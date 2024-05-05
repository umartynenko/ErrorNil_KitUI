//
//  TabBarViewController.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 05.05.2024.
//

import UIKit

class TabBarViewController: UITabBarController {
    private let collectionData = SectionCollections.mocData()
    
    private var userData: [ItemCollection] = []
    private var messagesViewController: MessagesViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userData = collectionData.last?.items ?? []
        
        setupVC()
        
        view.backgroundColor = .appColorViewGray
    }
    
    func setupVC() {
        let mainVC = TabBarElements.createtabBarVC(
            viewController: ViewController(),
            tabBarTitle: "Main",
            imageElement: "house",
            selectedImageElement: "house.fill"
        )
        let messagesVC = MessagesViewController() // Создание экземпляра MessagesViewController
        let messagesTabBarItem = TabBarElements.createtabBarVC(
            viewController: messagesVC,
            tabBarTitle: "Message",
            imageElement: "message",
            selectedImageElement: "message.fill"
        )
        messagesTabBarItem.tabBarItem.badgeValue = String(userData.count)
        
        self.messagesViewController = messagesVC
        
        passDataToMessagesViewController(data: userData)
        
        let profileVC = TabBarElements.createtabBarVC(
            viewController: ProfileViewController(),
            tabBarTitle: "Profile",
            imageElement: "person.circle",
            selectedImageElement: "person.fill"
        )
        
        setViewControllers([mainVC, messagesVC, profileVC], animated: true)
    }
    
    func passDataToMessagesViewController(data: [ItemCollection]) {
        self.messagesViewController?.usersSection = data
    }
}
