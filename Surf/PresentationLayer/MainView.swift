//
//  MainView.swift
//  Surf
//
//  Created by Егор  Хлямов on 10.08.2023.
//

import Foundation
import UIKit

final class MainView: UIView{
    
    weak var delegate: MainViewController?
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let topView = UIView()
    let topBarView = UIView()
    let avatarView = UIImageView()
    let nameLabel = UILabel()
    let statusLabel = UILabel()
    let cityLabel = UIStackView()
    let bottomView = UIView()
    let skillsHeader = UIStackView()
    let aboutStack = UIStackView()
    private let alignedFlowLayout = LeftAlignedFlowLayout()
    lazy var skillsCollection = SkillsCollectionView(frame: .zero, collectionViewLayout: alignedFlowLayout)
    let skillsLabel = UILabel()
    let titleLabel = UILabel()
    let editButton = UIButton()
    let aboutLabel = UILabel()
    let info = UILabel()
    let filterView = UIView()
    
    let cityName = UILabel()
    let cityImageView = UIImageView(image: UIImage(named: "map"))
    
    let singletone = Singletone.shared
    
    func didLoad(){
        setupStyle()
        setupLayout()
    }
    private func setupLayout(){
        
        
        topBarView.translatesAutoresizingMaskIntoConstraints = false
        topView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        skillsHeader.translatesAutoresizingMaskIntoConstraints = false
        skillsCollection.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        info.translatesAutoresizingMaskIntoConstraints = false
        filterView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(topView)
        topView.addSubview(topBarView)
        topView.addSubview(titleLabel)
        topView.addSubview(avatarView)
        topView.addSubview(nameLabel)
        topView.addSubview(statusLabel)
        topView.addSubview(cityLabel)
        cityLabel.addArrangedSubview(cityImageView)
        cityLabel.addArrangedSubview(cityName)
        contentView.addSubview(bottomView)
        
        bottomView.addSubview(skillsHeader)
        skillsHeader.addArrangedSubview(skillsLabel)
        skillsHeader.addArrangedSubview(editButton)
        bottomView.addSubview(skillsCollection)
        bottomView.addSubview(aboutLabel)
        bottomView.addSubview(info)
        bottomView.addSubview(filterView)
        
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: cityLabel.bottomAnchor,constant: 16),
            
            topBarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBarView.trailingAnchor.constraint(equalTo: leadingAnchor),
            topBarView.topAnchor.constraint(equalTo: topView.topAnchor,constant: 0),
            topBarView.heightAnchor.constraint(equalToConstant: 0),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topBarView.bottomAnchor, constant: 24),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),

            avatarView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 120),
            avatarView.heightAnchor.constraint(equalToConstant: 120),
            avatarView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor , constant: 24),
            
            nameLabel.widthAnchor.constraint(equalToConstant: bounds.width),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: self.avatarView.bottomAnchor , constant: 16),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            cityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor , constant: 1),

            cityImageView.widthAnchor.constraint(equalToConstant:  12) ,
            cityImageView.heightAnchor.constraint(equalToConstant: 16),
            cityImageView.rightAnchor.constraint(equalTo: cityName.leftAnchor,constant: 0),
            
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            //bottomView.bottomAnchor.constraint(equalTo: skillsHeader.bottomAnchor, constant: 20),
            bottomView.bottomAnchor.constraint(equalTo: info.bottomAnchor, constant: 20),
            
            skillsHeader.topAnchor.constraint(equalTo: bottomView.topAnchor,constant: 16),
            skillsHeader.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 16),
            skillsHeader.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor,constant: -16),
            editButton.widthAnchor.constraint(equalToConstant: 24),
            editButton.heightAnchor.constraint(equalTo: editButton.widthAnchor),
            
            
            skillsCollection.topAnchor.constraint(equalTo: skillsHeader.bottomAnchor,constant: 16),
            skillsCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            skillsCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            
            aboutLabel.topAnchor.constraint(equalTo: skillsCollection.bottomAnchor, constant: 16),
            aboutLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 16),
            aboutLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            
            info.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 16),
            info.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 16),
            info.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            info.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            
            filterView.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 0),
            filterView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 0),
            filterView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            filterView.heightAnchor.constraint(equalToConstant: 600)
           
            
//            skillsCollection.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
//            skillsCollection.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
//            skillsCollection.heightAnchor.constraint(equalToConstant: CGFloat(((singletone.getSkills().count - 1 )/3 + 1))*55.0),

            
            
        ])
    }
    
    func setupStyle(){
        // -- scrollView
        scrollView.frame = bounds
        scrollView.clipsToBounds = true
        scrollView.contentInsetAdjustmentBehavior = .always
        scrollView.isScrollEnabled = true
        topView.backgroundColor = UIColor(hex: "#F3F3F5")
        scrollView.backgroundColor = UIColor(hex: "#F3F3F5")
        filterView.backgroundColor = .white
        // -- navBar
        topBarView.backgroundColor = .red
        titleLabel.text = "Профиль"
        titleLabel.textAlignment = .center
        titleLabel.center = topBarView.center
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        // -- nameLabel
        nameLabel.text = "Хлямов Егор \n Сергеевич"
        nameLabel.numberOfLines = 2
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        nameLabel.textAlignment = .center
        // -- avatar
        avatarView.image = UIImage(named: "scale_1200")
        avatarView.clipsToBounds = true
        avatarView.layer.cornerRadius = 60
        // -- statusLabel
        statusLabel.text = "IT-Раздолбай, опыт более 3-х лет"
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = UIColor(hex: "#96959B")
        statusLabel.textAlignment = .center
        // -- cityLabel
        cityLabel.alignment = .center
        cityLabel.axis = .horizontal
        cityLabel.spacing = 0
        
        cityName.text = "Ярославль"
        cityName.font =  .systemFont(ofSize: 14, weight: .regular)
        cityName.textColor = UIColor(hex: "#96959B")
        cityName.textAlignment = .center
        
        // -- SkillsStack
        bottomView.backgroundColor = .white
        
        // -- skillsHeader
        skillsHeader.axis = .horizontal
        skillsLabel.text = "Мои навыки"
        skillsLabel.font =  .systemFont(ofSize: 16, weight: .medium)
        skillsLabel.textAlignment = .left
        editButton.setImage(UIImage(named: "pencil"), for: .normal)
        editButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // -- SkillsCollection

       // skillsStack.addArrangedSubview(skillsCollection)
       // skillsStack.addArrangedSubview(aboutStack)
        skillsCollection.dataSource = delegate
        skillsCollection.register(SkillCell.self, forCellWithReuseIdentifier: SkillCell.reuseIdentifier)
        skillsCollection.register(AddCell.self, forCellWithReuseIdentifier: AddCell.reuseIdentifier)
        alignedFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        // -- About
        aboutStack.axis = .vertical
        aboutStack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        aboutStack.isLayoutMarginsRelativeArrangement = true
        aboutStack.spacing = 10

        aboutLabel.text = "О себе"
        aboutLabel.font =  .systemFont(ofSize: 16, weight: .medium)
        aboutLabel.textAlignment = .left
        

        info.text = "Меня зовут Егор. Учусь на третьем курсе Ярославского политеха. Изучаю ios разработку. До этого писал на python и php. Считаю, что в написании костылей мне нет равных"
        info.font =  .systemFont(ofSize: 14, weight: .regular)
        info.textAlignment = .left
        info.numberOfLines = 0
        info.textAlignment = .left
  //      aboutStack.addArrangedSubview(label)
        aboutStack.addArrangedSubview(info)
    }
    

    @objc func buttonTapped(){
        delegate?.EditDidTap()
    }
    

    
    func reloadData() {
        skillsCollection.reloadData()
    }
}
