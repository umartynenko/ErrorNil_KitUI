//
//  LoginViewController.swift
//  MOD3_HW1
//
//  Created by Юрий Мартыненко on 29.05.2024.
//

import UIKit

class LoginViewController: UIViewController {
    let singletonRegistration = SingletonRegistration.shared
    
    lazy var customTitle = MyAppElements.createTitleLabel(text: "Войти", size: 34, textColor: .white)
    lazy var emailField = MyAppElements.createTextField(placeholder: "Почта", keyboardType: .emailAddress)
    lazy var passwordField = MyAppElements.createTextField(
        placeholder: "Пароль",
        secure: true,
        target: self,
        action: #selector(
            togglePasswordVisibility
        )
    )
    lazy var loginnButton = MyAppElements.createButton(
        title: "Войти".uppercased(),
        color: .buttonPurp,
        corner: 14,
        colorTitle: .white
    )
    lazy var textQuestion = MyAppElements.createTextLabel(text: "У вас нет аккаунта?", size: 18, color: .textGray)
    lazy var textButtonRegistration = MyAppElements.createLinkButton(
        title: "Регистрация",
        titleColor: .buttonPurp,
        fontSize: 16,
        weight: .bold
    )
    lazy var HSView = MyAppElements.createHSView(alignment: .center, distribution: .fill)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        loginnButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        textButtonRegistration.addTarget(self, action: #selector(textButtonRegistrationTapped), for: .touchUpInside)
        
        emailField.autocapitalizationType = .none
        
        HSView.addArrangedSubview(textQuestion)
        HSView.addArrangedSubview(textButtonRegistration)
        
        [customTitle, emailField, passwordField, loginnButton, HSView].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            customTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 319),
            customTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customTitle.heightAnchor.constraint(equalToConstant: 40),
            
            emailField.topAnchor.constraint(equalTo: customTitle.bottomAnchor, constant: 26),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            emailField.heightAnchor.constraint(equalToConstant: 71),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 15),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            passwordField.heightAnchor.constraint(equalToConstant: 71),
            
            loginnButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 60),
            loginnButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            loginnButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            loginnButton.heightAnchor.constraint(equalToConstant: 71),
            
            HSView.topAnchor.constraint(equalTo: loginnButton.bottomAnchor, constant: 33),
            HSView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func togglePasswordVisibility(_ sender: UIButton) {
        guard let container = sender.superview, let passwordField = container.superview as? UITextField else { return }
        passwordField.isSecureTextEntry.toggle()
        
        let buttonImageName = passwordField.isSecureTextEntry ? "eye" : "eye.slash"
        sender.setImage(UIImage(systemName: buttonImageName), for: .normal)
        
        if let existingText = passwordField.text {
            passwordField.text = ""
            passwordField.text = existingText
        }
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailField.text?.trimmingCharacters(in: .whitespaces), !email.isEmpty, isValidEmail(email) else {
            showAlert(message: "Пользователь с таким Email не найден")
            
            return
        }
        
        guard let pass = passwordField.text?.trimmingCharacters(in: .whitespaces), !pass.isEmpty, isValidPassword(pass)else {
            showAlert(message: "Не верный пароль")
            
            return
        }
        
        self.singletonRegistration.emailUser = emailField.text
        self.singletonRegistration.passUser = passwordField.text
        
        NotificationCenter.default.post(Notification(name: .setRoot, userInfo: ["vc": "profile"]))
        
        print(singletonRegistration.emailUser ?? "")
        print(singletonRegistration.passUser ?? "")
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        if email == singletonRegistration.emailUser {
            return true
        }
        
        return false
    }
    
    func isValidPassword(_ pass: String) -> Bool {
        if pass == singletonRegistration.passUser {
            return true
        }
        
        return false
    }
    
    @objc func textButtonRegistrationTapped(_ sender: UIButton) {
        NotificationCenter.default.post(Notification(name: .setRoot, userInfo: ["vc": "registration"]))
    }
}
