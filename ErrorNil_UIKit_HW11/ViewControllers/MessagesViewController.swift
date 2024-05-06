//
//  MessagesViewController.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 05.05.2024.
//

import UIKit


class MessagesViewController: UIViewController {
    var usersSection: [ItemCollection] = []
    
    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "userCell")
        $0.dataSource = self
        $0.layer.cornerRadius = 30
//        $0.delegate = self
        
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        navigationItem.title = "Сообщения"
    }
}


extension MessagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersSection.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = usersSection[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = user.userName
        config.secondaryText = "\(user.text)"
        
        if let image = UIImage(named: user.image) {
            let resizedImage = image.resizedToSquare(ofSize: 56)
            let roundedImage = resizedImage.roundedImage(cornerRadius: 28) // Функция, которая делает изображение круглым
            config.image = roundedImage
        }
        
        cell.contentConfiguration = config
        
        return cell
    }
}

extension UIImage {
    func resizedToSquare(ofSize size: CGFloat) -> UIImage {
        let newSize = CGSize(width: size, height: size)
        let renderer = UIGraphicsImageRenderer(size: newSize)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
    
    func roundedImage(cornerRadius: CGFloat) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            UIBezierPath(roundedRect: CGRect(origin: .zero, size: size), cornerRadius: cornerRadius).addClip()
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
