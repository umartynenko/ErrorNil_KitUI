//
//  MainNewsFooterCollectionReusableView.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 05.05.2024.
//

import UIKit

class MainNewsFooterCollectionReusableView: UICollectionReusableView {
    static let reuseId = "MainNewsFooterCollectionReusableView"
    
    private lazy var headerStack: UIStackView = {
        .config(view: $0) { headerStack in
            headerStack.axis = .horizontal
            headerStack.distribution = .equalSpacing
            headerStack.alignment = .top
            [footerText].forEach { headerStack.addArrangedSubview($0) }
        }
    }(UIStackView())
    
    private lazy var footerText: UILabel = {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .appColorUserCellText
        $0.numberOfLines = 0
        $0.textAlignment = .left

        return $0
    }(UILabel())
    
    func setupFooter(footer: String) {
        addSubview(headerStack)
        footerText.text = footer
        
        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: topAnchor),
            headerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            headerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            headerStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
