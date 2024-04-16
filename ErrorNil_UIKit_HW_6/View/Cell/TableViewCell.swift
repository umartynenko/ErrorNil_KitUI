//
//  TableViewCell.swift
//  ErrorNil_UIKit_HW_6
//
//  Created by Юрий Мартыненко on 14.04.2024.
//

import UIKit

final class ListViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
    }
    
    var completion: (() -> Void)?
    
    func setupCell(item: CustomCellFirstView) {
        lazy var cellView: UIView = {
            $0.backgroundColor = .white
            return $0
        }(UIView(frame: bounds))
        
        lazy var viewInCell: UIView = {
            $0.backgroundColor = .appGray
            $0.frame = CGRect(x: 30, y: 15, width: cellView.bounds.width - 60, height: cellView.bounds.width - 30)
            $0.layer.cornerRadius = 30
            
            return $0
        }(UIView())
        
        
        
        lazy var cellList = AppElement.createCell(
            name: item.iamge[0],
            frame: CGRect(x: 25, y: 15, width: viewInCell.bounds.width - 50, height: 190)
        )
        
        lazy var userNameCell = AppElement.userName(
            name: item.title,
            frame: CGRect(x: 20, y: 70, width: cellList.bounds.width - 40, height: 24),
            color: .white
        )
        
        lazy var userTextCell = AppElement.userNameText(
            name: item.message,
            frame: CGRect(x: 20, y: userNameCell.frame.maxY + 4, width: cellList.bounds.width - 40, height: 70), color: .white)
        
        lazy var cellSmallImageFirst = AppElement.createCell(
            name: item.iamge[1],
            frame: CGRect(x: 25, y: 15, width: viewInCell.bounds.width - 50, height: 163),
            corner: 20
        )
        
        lazy var cellSmallImageSecon = AppElement.createCell(
            name: item.iamge[2],
            frame: CGRect(x: 25, y: 15, width: viewInCell.bounds.width - 50, height: 163),
            corner: 20
        )
        
        lazy var cellSmallImageThird = AppElement.createCell(
            name: item.iamge[3],
            frame: CGRect(x: 25, y: 15, width: viewInCell.bounds.width - 50, height: 163),
            corner: 20
        )
        
        lazy var hStackCell: UIStackView = {
            $0.axis = .horizontal
            $0.spacing = 11
            $0.alignment = .center
            $0.distribution = .fillEqually
            $0.frame.size = CGSize(width: viewInCell.bounds.width - 50, height: 99)
            $0.frame.origin = CGPoint(x: 25, y: cellList.frame.maxY + 12)
            $0.addArrangedSubview(cellSmallImageFirst)
            $0.addArrangedSubview(cellSmallImageSecon)
            $0.addArrangedSubview(cellSmallImageThird)
            
            return $0
        }(UIStackView())
        
        
        
        lazy var cellUserButton: UIButton = {
            $0.setTitle("show details", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 24.5
            $0.frame.size = CGSize(width: viewInCell.frame.width - 50, height: 49)
            $0.frame.origin = CGPoint(x: 30, y: hStackCell.frame.maxY + 17)
            
            return $0
        }(UIButton(primaryAction: UIAction(handler: { [weak self] _ in
            self?.completion?()
        })))
        
        [userNameCell, userTextCell].forEach {cellList.addSubview($0)}
        [cellList, hStackCell, cellUserButton].forEach {viewInCell.addSubview($0)}

        cellView.addSubview(viewInCell)
        
        addSubview(cellView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
