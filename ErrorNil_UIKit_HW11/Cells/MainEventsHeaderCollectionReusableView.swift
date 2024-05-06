//
//  MainEventsCollectionReusableView.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 05.05.2024.
//

import UIKit

class MainEventsHeaderCollectionReusableView: UICollectionReusableView {
    static let reuseId = "MainEventsHeaderCollectionReusableView"
    
    var block: ( () -> Void)?
    
    lazy private var events = UIAction { [weak self] _ in
        self?.block?()
    }
    
    private lazy var headerStack: UIStackView = {
        .config(view: $0) { headerStack in
            headerStack.axis = .horizontal
            headerStack.distribution = .equalSpacing
            headerStack.alignment = .center
            [headerTitle, headerButton].forEach { headerStack.addArrangedSubview($0) }
        }
    }(UIStackView())
    private lazy var headerTitle: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.numberOfLines = 0
        
        return $0
    }(UILabel())
    private lazy var headerButton: UIButton = AppElements.createButton(setImage: "", title: "Подробнее", color: .systemBlue, action: events)
    
    func setupHeader(header: String) {
        addSubview(headerStack)
        headerTitle.text = header
        
        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: topAnchor),
            headerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            headerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            headerStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}