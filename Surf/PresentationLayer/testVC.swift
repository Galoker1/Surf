//
//  testVC.swift
//  Surf
//
//  Created by Егор  Хлямов on 12.08.2023.
//

import Foundation

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.overrideUserInterfaceStyle = .light
        view.backgroundColor = UIColor.white
        setupScrollView()
    }
    
    func setupScrollView() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        setupContent(in: contentView)
    }
    
    func setupContent(in view: UIView) {
        var previousView: UIView? = nil
        
        for i in 1...20 {
            let label = UILabel()
            label.text = "Label \(i)"
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                label.heightAnchor.constraint(equalToConstant: 40)
            ])
            
            if let previousView = previousView {
                label.topAnchor.constraint(equalTo: previousView.bottomAnchor, constant: 8).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
            }
            
            previousView = label
        }
        
        if let lastView = previousView {
            lastView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        }
    }
}
