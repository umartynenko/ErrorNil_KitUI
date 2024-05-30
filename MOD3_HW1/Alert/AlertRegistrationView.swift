//
//  AlertRegistrationView.swift
//  MOD3_HW1
//
//  Created by Юрий Мартыненко on 30.05.2024.
//

import UIKit


class AlertRegistrationView: UIViewController {
    func showAlertNoUsername() {
        let alert = UIAlertController(title: "Имя пользователя", message: "Вы не указали имя пользователя", preferredStyle: .alert)
        
        self.present(alert, animated: true)
    }
}
