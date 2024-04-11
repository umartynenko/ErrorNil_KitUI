//
//  UserViewController.swift
//  ErrorNil_UIKit_HW5
//
//  Created by Юрий Мартыненко on 11.04.2024.
//

import UIKit


class UserViewController: UIViewController {
    
    weak var delegate: ViewControllerDelegate?
    
    var userImage: String = ""
    var fullName: String = ""
    var userMassage: [String] = []
    var numSection: Int = 0
    var numRow: Int = 0
    var arrayOfDeletedMessages: [String] = []
    
    lazy var userImageAvatar: UIImageView = {
        $0.image = UIImage(named: userImage)
        $0.frame.size = CGSize(width: 136, height: 136)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 68
        $0.frame.origin = CGPoint(x: view.center.x - $0.frame.width / 2, y: 114)
        
        return $0
    }(UIImageView())
    
    lazy var userFullNameLabel: UILabel = {
        $0.text = fullName
        $0.font = .boldSystemFont(ofSize: 20)
        $0.frame.size = CGSize(width: view.frame.width - 60, height: 24)
        $0.frame.origin = CGPoint(x: 30, y: userImageAvatar.frame.maxY + 27)
        $0.textAlignment = .center
        
        return $0
    }(UILabel())
    
    lazy var userCellMessage = createUserMessageCell(userName: fullName, userMassages: userMassage, userImage: userImage)
    
    lazy var userMessageTableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "messageUserCell")
        $0.dataSource = self
        $0.delegate = self
        
        return $0
    }(UITableView(frame: CGRect(origin: CGPoint(x: 0, y: userFullNameLabel.frame.maxY + 50), size: CGSize(width: view.frame.width, height: view.frame.height)), style: .insetGrouped))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [userImageAvatar, userFullNameLabel, userMessageTableView].forEach {view.addSubview($0)}
    }
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userCellMessage.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageUserCell", for: indexPath)
        let user = userCellMessage[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = user.userName
        config.secondaryText = "\(user.message)"
        config.image = UIImage(named: user.image)
        config.imageProperties.maximumSize = CGSize(width: 40, height: 40)
        config.imageProperties.cornerRadius = 20
        
        cell.contentConfiguration = config
        
        return cell
    }
}


extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        arrayOfDeletedMessages.append(userCellMessage[indexPath.row].message)
        userCellMessage.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        self.delegate?.deletingUserMessage(section: numSection, row: numRow, messages: arrayOfDeletedMessages)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "MESSAGES"
    }
}
