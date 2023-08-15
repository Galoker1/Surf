//
//  SkillCell.swift
//  Surf
//
//  Created by Егор  Хлямов on 01.08.2023.
//

import Foundation
import UIKit

class SkillCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: SkillCell.self)
    
    var titleLabel = UILabel()
    var deleteButton = UIButton()
    var deleteImage = UIImage(named: "delete")
    
    private var textTrailing: NSLayoutConstraint?
    private var textDelete: NSLayoutConstraint?
    private var cellWidth: NSLayoutConstraint?
    
    var onDeleteTapped: (() -> Void)?
    
    let singletone = Singletone.shared
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupStyle()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("--")
    }
    
    func setupLayout(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(deleteButton)
        
        textTrailing = titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        textTrailing?.isActive = true
        
        textDelete = titleLabel.trailingAnchor.constraint(equalTo: deleteButton.trailingAnchor, constant: -20)
        
        cellWidth = contentView.widthAnchor.constraint(lessThanOrEqualToConstant: 200)
        cellWidth?.isActive = true
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

            deleteButton.widthAnchor.constraint(equalToConstant: 16),
            deleteButton.heightAnchor.constraint(equalToConstant: 16),
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
    }
    func setupStyle() {
        contentView.backgroundColor = UIColor(hex: "#F3F3F5")
        contentView.layer.cornerRadius = 14
        titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.8
        titleLabel.lineBreakMode = .byTruncatingTail
        
        deleteButton.tintColor = .black
        deleteButton.setImage(deleteImage, for: .normal)
        
        
    }
    func configure(model:String,isEditing:Bool,maxWidth:CGFloat){
        contentView.layoutIfNeeded()
        
        titleLabel.text = model
        titleLabel.invalidateIntrinsicContentSize()
        
        deleteButton.isHidden = !isEditing
        textTrailing?.isActive = !isEditing
        textDelete?.isActive = isEditing
        
        cellWidth?.constant = maxWidth
        
        deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
    }
    

    @objc private func deleteTapped(){
        onDeleteTapped?()
    }
}
