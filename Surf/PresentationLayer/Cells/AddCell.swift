//
//  AddCell.swift
//  Surf
//
//  Created by Егор  Хлямов on 14.08.2023.
//

import Foundation
import UIKit

class AddCell: UICollectionViewCell{
    
    static let reuseIdentifier = String(describing: AddCell.self)
    var onAddTapped:(()->Void)?
    private let addButton = UIButton()
    private let addImage = UIImage(systemName:"plus")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
        setupStyle()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        addButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            addButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
    }
    private func setupStyle(){
        contentView.backgroundColor = UIColor(hex: "#F3F3F5")
        contentView.layer.cornerRadius = 14
        addButton.tintColor = .black
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        
    }
    @objc func addTapped(){
        onAddTapped?()
    }
    
}
