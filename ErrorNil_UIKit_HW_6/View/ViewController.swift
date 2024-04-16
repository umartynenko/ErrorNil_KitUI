//
//  ViewController.swift
//  ErrorNil_UIKit_HW_6
//
//  Created by Юрий Мартыненко on 14.04.2024.
//

import UIKit

final class ViewController: UIViewController {
    private var tableData = CustomCellFirstView.appData()
    
    private lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(ListViewCell.self, forCellReuseIdentifier: "cell")
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.frame))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List"
        navigationController?.navigationBar.prefersLargeTitles = true

        view.backgroundColor = .white
        view.addSubview(tableView)
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListViewCell
        cell.setupCell(item: tableData[indexPath.row])
        cell.selectionStyle = .none
        cell.completion = { [weak self] in
            let userDetailVC = UserDetailViewController()
            userDetailVC.userName = (self?.tableData[indexPath.row].title)!
            userDetailVC.titleImage = (self?.tableData[indexPath.row].iamge[0])!
            userDetailVC.text = (self?.tableData[indexPath.row].message)!
            userDetailVC.arraUserImage = Array((self?.tableData[indexPath.row].iamge[1...3])!)
            self?.navigationController?.pushViewController(userDetailVC, animated: true)
        }
    
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            view.frame.width
    }
}

