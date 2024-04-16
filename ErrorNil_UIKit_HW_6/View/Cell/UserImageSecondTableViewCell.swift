//
//  UserImageSecondTableViewCell.swift
//  ErrorNil_UIKit_HW_6
//
//  Created by Юрий Мартыненко on 16.04.2024.
//

import UIKit

class UserImageSecondTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true 
    }
    
    func setupImageCell(item: UserImage) {
        let cellView: UIView = {
            
            return $0
        }(UIView(frame: bounds))
        
        let cellImage: UIImageView = {
            $0.image = UIImage(named: item.image)
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 20
            $0.clipsToBounds = true
            
            return $0
        }(UIImageView(frame: CGRect(x:   30, y: 30, width: cellView.bounds.width - 60, height: 201)))
        
        addSubview(cellImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
