//
//  ViewController.swift
//  ErrorNil_UIKit_HW7
//
//  Created by Юрий Мартыненко on 17.04.2024.
//

import UIKit


class ViewController: UIViewController {
    private var tableData = Item.content()
    
    lazy var tableView: UITableView = {
        .config(view: $0) { view in
            view.dataSource = self
            view.register(ItemCell.self, forCellReuseIdentifier: "cell")
            view.rowHeight = UITableView.automaticDimension
        }
    }(UITableView(frame: .zero))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
        NSLayoutConstraint.activate(
            [
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide .topAnchor, constant: 67),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        cell.setupCell(item: tableData[indexPath.row])
        
        return cell
    }
}
