//
//  MainViewControllerAssembly.swift
//  Surf
//
//  Created by Егор  Хлямов on 10.08.2023.
//

import Foundation
import UIKit

struct MainViewControllerAssembly {
    func create() -> UIViewController {
        let mainView = MainView()
        let skillService = Singletone.shared
        let controller = MainViewController(mainView: mainView, service: skillService)
        
        mainView.delegate = controller
        return controller
        
    }
}
