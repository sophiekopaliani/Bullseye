//
//  CategoryListCell.swift
//  Bullseye
//
//  Created by Sophio Kopaliani on 10/08/2022.
//

import UIKit

class CategoryListCell: UITableViewCell {
    
    let label: UILabel = {
        let l = UILabel()
        l.text = "test"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(label)
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
       // label.height = 20
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}

