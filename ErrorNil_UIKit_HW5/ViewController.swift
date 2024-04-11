//
//  ViewController.swift
//  ErrorNil_UIKit_HW5
//
//  Created by Юрий Мартыненко on 11.04.2024.
//

import UIKit


protocol ViewControllerDelegate: AnyObject {
    func deletingUserMessage(section: Int, row: Int, messages: [String])
}


class ViewController: UIViewController {
    private var users = generatorCellUser()
    
    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "userCell")
        $0.dataSource = self
        $0.layer.cornerRadius = 30
        $0.delegate = self
        
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        title = "Friends"
        print(users)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = users[indexPath.section][indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = user.userName
        config.secondaryText = "\(user.messages.count) сообщений"
        config.image = UIImage(named: user.image)
        config.imageProperties.maximumSize = CGSize(width: 40, height: 40)
        config.imageProperties.cornerRadius = 20
        
        cell.contentConfiguration = config
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userVC = UserViewController()
        userVC.delegate = self
        userVC.fullName = users[indexPath.section][indexPath.row].userName
        userVC.userImage = users[indexPath.section][indexPath.row].image
        userVC.userMassage = users[indexPath.section][indexPath.row].messages
        userVC.numSection = indexPath.section
        userVC.numRow = indexPath.row
        
        self.navigationController?.pushViewController(userVC, animated: true)
    }
    
    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        users[indexPath.section][indexPath.row].messages.remove(at: 0)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return "NEW"
            case 1:
                return "BEST"
            default:
                return ""
        }
    }
}


extension ViewController: ViewControllerDelegate {
    func deletingUserMessage(section: Int, row: Int, messages: [String]) {
        for message in messages {
            for (index, messageDelete) in users[section][row].messages.enumerated() {
                if messageDelete == message {
                    users[section][row].messages.remove(at: index)
                }
            }
        }
        tableView.reloadData()
    }
}
