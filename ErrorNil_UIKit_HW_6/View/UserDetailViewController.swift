//
//  UserDetailViewController.swift
//  ErrorNil_UIKit_HW_6
//
//  Created by Юрий Мартыненко on 16.04.2024.
//

import UIKit



final class UserDetailViewController: UIViewController {
    var userName: String = ""
    var titleImage: String = ""
    var text: String = ""
    var arraUserImage: [String] = []
    
    private lazy var userNameLabel = AppElement.userName(
        name: userName,
        textAlignment: .center,
        frame: CGRect(x: 30, y: 100, width: view.frame.width - 60, height: 30),
        color: .black,
        fontSize: 36
    )
    
    private lazy var titleImageView = AppElement.createCell(
        name: titleImage,
        frame: CGRect(x: 30, y: userNameLabel.frame.maxY + 25, width: view.frame.width - 60, height: 189)
    )
    
    private lazy var textUserLabelView = AppElement.userNameText(
        name: text,
        textAlignment: .center,
        frame: CGRect(x: 30, y: titleImageView.frame.maxY + 25, width: view.frame.width - 60, height: 57),
        color: .black
    )
    
    private lazy var userCellImage = createUserMessageCell(userImage: arraUserImage)
    
    private lazy var userImageTableView: UITableView = {
        $0.register(UserImageSecondTableViewCell.self, forCellReuseIdentifier: "imageUserCell")
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        
        return $0
    }(UITableView(frame: CGRect(origin: CGPoint(x: 0, y: textUserLabelView.frame.maxY + 44), size: CGSize(width: view.frame.width, height: view.frame.width))))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        [userNameLabel, titleImageView, textUserLabelView, userImageTableView].forEach {view.addSubview($0)}
    }
}


extension UserDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userCellImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageUserCell", for: indexPath) as! UserImageSecondTableViewCell
        cell.setupImageCell(item: userCellImage[indexPath.row ])
        cell.selectionStyle = .none
        
        return cell
    }
}


extension UserDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        235
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageVC = ImageViewController()
        imageVC.imageUser = userCellImage[indexPath.row].image
        
        self.navigationController?.pushViewController(imageVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Фотографии"
    }
}
