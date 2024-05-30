//
//  ViewController.swift
//  MOD3_HW1
//
//  Created by Юрий Мартыненко on 28.05.2024.
//

import UIKit

class ViewController: UIViewController {
    let singletonRegistration = SingletonRegistration.shared
    
    lazy var customTitle = MyAppElements.createTitleLabel(text: "Регистрация", size: 34, weight: .bold, textColor: .white)
    lazy var nameField = MyAppElements.createTextField(placeholder: "Имя")
    lazy var emailField = MyAppElements.createTextField(placeholder: "Почта", keyboardType: .emailAddress)
    lazy var passwordField = MyAppElements.createTextField(
        placeholder: "Пароль",
        secure: true,
        target: self,
        action: #selector(
            togglePasswordVisibility
        )
    )
    lazy var textAgreement = MyAppElements.createTextLabel(
        text: "Я согласен с Условиями предоставления услуг и Политикой конфиденциальности",
        size: 14,
        color: .textGray
    )
    lazy var registrationButton = MyAppElements.createButton(
        title: "Регистрация".uppercased(),
        color: .buttonPurp,
        corner: 14,
        colorTitle: .white
    )
    lazy var textQuestion = MyAppElements.createTextLabel(text: "Уже есть аккаунт?", size: 18, color: .textGray)
    lazy var textButtonLogin = MyAppElements.createLinkButton(
        title: "Войти",
        titleColor: .buttonPurp,
        fontSize: 16,
        weight: .bold
    )
    lazy var HSView = MyAppElements.createHSView(alignment: .center, distribution: .fill)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        registrationButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        textButtonLogin.addTarget(self, action: #selector(textButtonLoginTapped), for: .touchUpInside)
        
        emailField.autocapitalizationType = .none
        
        HSView.addArrangedSubview(textQuestion)
        HSView.addArrangedSubview(textButtonLogin)
        
        [customTitle, nameField, emailField, passwordField, textAgreement, registrationButton, HSView].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            customTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 279),
            customTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customTitle.heightAnchor.constraint(equalToConstant: 40),
            
            nameField.topAnchor.constraint(equalTo: customTitle.bottomAnchor, constant: 23),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            nameField.heightAnchor.constraint(equalToConstant: 71),
            
            emailField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 15),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            emailField.heightAnchor.constraint(equalToConstant: 71),
            
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 15),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            passwordField.heightAnchor.constraint(equalToConstant: 71),
            
            textAgreement.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 32),
            textAgreement.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            textAgreement.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            registrationButton.topAnchor.constraint(equalTo: textAgreement.bottomAnchor, constant: 51),
            registrationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            registrationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            registrationButton.heightAnchor.constraint(equalToConstant: 71),
            
            HSView.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 33),
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
    
    @objc func registerButtonTapped(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            showAlert(message: "Пожалуйста, введите имя")
            
            return
        }
        
        guard let email = emailField.text?.trimmingCharacters(in: .whitespaces), !email.isEmpty, isValidEmail(email) else {
            showAlert(message: "Пожалуйста, введите корректную почту")
            
            return
        }
        
        guard let pass = passwordField.text?.trimmingCharacters(in: .whitespaces), !pass.isEmpty else {
            showAlert(message: "Пожалуйста, введите пароль")
            
            return
        }
        
        self.singletonRegistration.emailUser = emailField.text
        self.singletonRegistration.passUser = passwordField.text
        
        NotificationCenter.default.post(Notification(name: .setRoot, userInfo: ["vc": "login"]))
        
        print(singletonRegistration.emailUser ?? "")
        print(singletonRegistration.passUser ?? "")
    }
    
    @objc func textButtonLoginTapped(_ sender: UIButton) {
        NotificationCenter.default.post(Notification(name: .setRoot, userInfo: ["vc": "login"]))
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailReg)
        
        return emailPred.evaluate(with: email)
    }
}

extension Notification.Name {
    static let setRoot = Notification.Name("setRoot")
}

