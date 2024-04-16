//
//  ImageViewController.swift
//  ErrorNil_UIKit_HW_6
//
//  Created by Юрий Мартыненко on 16.04.2024.
//

import UIKit

class ImageViewController: UIViewController {
    var imageUser: String = ""
    
    
    lazy var image: UIImageView = {
        $0.image = UIImage(named: imageUser)
        $0.contentMode = .scaleAspectFit
        
        return $0
    }(UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(image)
    }
}
