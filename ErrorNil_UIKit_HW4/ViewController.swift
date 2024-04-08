//
//  ViewController.swift
//  ErrorNil_UIKit_HW4
//
//  Created by Юрий Мартыненко on 07.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var appName = AppElements.createLabel(
        text: "Find Me",
        font: .boldSystemFont(ofSize: 36),
        size: CGSize(width: view.frame.width - 60, height: 36),
        position: CGPoint(x: 30, y: 63),
        colot: .appBlack
    )
    lazy var userUIImageView: UIImageView = {
        $0.image = UIImage(named: "46cbeddd920e98fbfbd8da6fa37c9afd")
        $0.frame.size = CGSize(width: view.frame.width - 60, height: 392)
        $0.frame.origin = CGPoint(x: view.center.x - $0.frame.size.width / 2, y: appName.frame.maxY + 28)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 40
        $0.contentMode = .scaleAspectFill
        
        return $0
    }(UIImageView())
    lazy var roundDotButton = AppElements.createRoundButton(
        logotip: "three_dots_menu_icon_184614",
        corner: 24.5,
        size: CGSize(width: 49, height: 49),
        position: CGPoint(x: userUIImageView.frame.width - 76, y: 21),
        iconPadding: NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    )
    lazy var roundInstagramButton = AppElements.createRoundButton(
        color: .black,
        logotip: "instagram_f_icon-icons.com_65485",
        corner: 17,
        size: CGSize(width: 34, height: 34),
        position: CGPoint(x: 0, y: 21),
        iconPadding: NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    )
    lazy var roundTikTokButton = AppElements.createRoundButton(
        color: .black,
        logotip: "tiktok_logo_icon_144802",
        corner: 17,
        size: CGSize(width: 34, height: 34),
        position: CGPoint(x: 42, y: 21),
        iconPadding: NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    )
    lazy var roundVCButton = AppElements.createRoundButton(
        color: .black,
        logotip: "rus-vk-02_icon-icons.com_50758",
        corner: 17,
        size: CGSize(width: 34, height: 34),
        position: CGPoint(x: 54, y: 21),
        iconPadding: NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    )
    lazy var roundСrossButton = AppElements.createRoundButton(
        color: .appGray,
        logotip: "efb29f935440baa36369b59581916287",
        corner: 32.5,
        size: CGSize(width: 65, height: 65),
        position: CGPoint(x: 30, y: userUIImageView.frame.maxY + 28),
        logoTintColor: .black,
        iconPadding: NSDirectionalEdgeInsets(top: 21, leading: 21, bottom: 21, trailing: 21)
    )
    lazy var roundHeartButton = AppElements.createRoundButton(
        color: .appGray,
        logotip: "351d8daef2f0d70572d53c16d2c9f3ac",
        corner: 32.5,
        size: CGSize(width: 65, height: 65),
        position: CGPoint(x: view.frame.maxX - 95, y: userUIImageView.frame.maxY + 28),
        logoTintColor: .red,
        iconPadding: NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
    )
    lazy var wtireButton: UIButton = {
        $0.setTitle("Написать", for: .normal)
        $0.backgroundColor = .appGreen
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.layer.cornerRadius = 20
        $0.frame.origin = CGPoint(x: roundСrossButton.frame.maxX + 16, y: userUIImageView.frame.maxY + 36)
        $0.frame.size = CGSize(width: roundHeartButton.frame.minX - roundСrossButton.frame.maxX - 32, height: 50)
        
        return $0
    }(UIButton())
    lazy var hStackSocila: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 12
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.frame.size = CGSize(width: 126, height: 34)
        $0.frame.origin = CGPoint(x: 31, y: roundDotButton.center.y - $0.frame.size.height/2)
        $0.addArrangedSubview(roundInstagramButton)
        $0.addArrangedSubview(roundTikTokButton)
        $0.addArrangedSubview(roundVCButton)
        
        return $0
    }(UIStackView())
    
    lazy var nameLabel = AppElements.createLabel(text: "Боня Васюкова", font: .boldSystemFont(ofSize: 20), size: CGSize(width: 800, height: 24), position: CGPoint(x: 0, y: 0 ), colot: .white)
    lazy var ageLabel = AppElements.createLabel(text: "25 лет", font: .systemFont(ofSize: 16), size: CGSize(width: 800, height: 19), position: CGPoint(x: 0, y: 0 ), colot: .white)
    lazy var medal: UIImageView = {
        $0.image = UIImage(named: "3074870375a79ea025b44239b2132819")
        
        return $0
    }(UIImageView())
    
    lazy var hStackLabelName: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 1
        $0.alignment = .leading
        $0.distribution = .fillEqually
        $0.frame.size = CGSize(width: 200, height: 34)
        $0.frame.origin = CGPoint(x: 31, y: 1)
        $0.addArrangedSubview(nameLabel)
        $0.addArrangedSubview(medal)
        
        return $0
    }(UIStackView())
    
    lazy var vStackLabelName: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 1
        $0.alignment = .leading
        $0.distribution = .equalSpacing
        $0.frame.size = CGSize(width: userUIImageView.frame.width - 60, height: 44)
        $0.frame.origin = CGPoint(x: 30, y: 298)
        $0.addArrangedSubview(hStackLabelName)
        $0.addArrangedSubview(ageLabel)
        
        
        
        return $0
    }(UIStackView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [roundDotButton, hStackSocila, vStackLabelName].forEach {userUIImageView.addSubview($0)}
        
        [appName, userUIImageView, roundСrossButton, roundHeartButton, wtireButton].forEach {view.addSubview($0)}
    }


}

