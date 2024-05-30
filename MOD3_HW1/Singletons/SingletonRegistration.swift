//
//  singletonRegistration.swift
//  MOD3_HW1
//
//  Created by Юрий Мартыненко on 30.05.2024.
//

import Foundation


class SingletonRegistration {
    static let shared = SingletonRegistration()
    
    var emailUser: String?
    var passUser: String?
    
    private init() {}
}
