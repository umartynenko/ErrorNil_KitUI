//
//  AboutUserViewController.swift
//  ErrorNil_UIKit_HW3
//
//  Created by Юрий Мартыненко on 06.04.2024.
//

import UIKit

class AboutUserViewController: UIViewController {
    
    
    var about: String = ""
    var fullName: String = ""
    
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
        text: fullName,
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
    lazy var aboutTextView: UITextView = {
        $0.text = about
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
        
        title = fullName
        view.backgroundColor = .white
        
        [userAvatarImage, userNameLabel, aboutLabel, aboutTextView].forEach {view.addSubview($0)}
    }
}
