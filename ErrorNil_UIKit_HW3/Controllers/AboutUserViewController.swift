//
//  AboutUserViewController.swift
//  ErrorNil_UIKit_HW3
//
//  Created by Юрий Мартыненко on 06.04.2024.
//

import UIKit

class AboutUserViewController: UIViewController {
    
    lazy var userAvatarImage = AppElements.avatarImage(
        imageName: "a339940abd3883404a496de92e27fbd0",
        scale: .scaleAspectFill,
        sizeWidgt: 75,
        sizeHeight: 75,
        position: CGPoint(x: 17, y: 95),
        centerX: view.center.x,
        corner: 20
    )
    
    lazy var userNameLabel = AppElements.createLabel(
        text: "Имя Фамилия",
        textAligmet: .center,
        position: CGPoint(x: 30, y: userAvatarImage.frame.maxY + 23),
        size: CGSize(width: view.frame.width - 60, height: 19),
        fontSize: 16,
        fontColot: .black
    )
    
    lazy var aboutLabel = AppElements.createLabel(
        text: "О себе",
        textAligmet: .left,
        position: CGPoint(x: 30, y: userNameLabel.frame.maxY + 33),
        size: CGSize(width: view.frame.width - 60, height: 19),
        fontSize: 16,
        fontColot: .appGrayAbout
    )
    
    //    lazy var aboutTextField = AppElements.createTextField(color: .appGray, corner: 15, size: CGSize(width: view.frame.width - 60, height: 158), position: CGPoint(x: 30, y: aboutLabel.frame.maxY + 9))
    
    lazy var aboutTextView: UITextView = {
        $0.text = """
        During the next launch cycle, the view attempts to restore these properties to their saved values. If the selection range can’t be applied to the text in the restored view, no text is selected. For more information about how state preservation and restoration works, see App Programming Guide for iOS.
        During the next launch cycle, the view attempts to restore these properties to their saved values. If the selection range can’t be applied to the text in the restored view, no text is selected. For more information about how state preservation and restoration works, see App Programming Guide for iOS.
"""
        $0.font = .systemFont(ofSize: 15)
        $0.backgroundColor = .appGray
        $0.layer.cornerRadius = 15
        $0.frame.size = CGSize(width: view.frame.width - 60, height: 158)
        $0.frame.origin = CGPoint(x: 30, y: aboutLabel.frame.maxY + 9)
        $0.showsVerticalScrollIndicator = true
        
        
        return $0
    }(UITextView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Имя Фамилия"
        view.backgroundColor = .white
        
        [userAvatarImage, userNameLabel, aboutLabel, aboutTextView].forEach {view.addSubview($0)}
    }
}
