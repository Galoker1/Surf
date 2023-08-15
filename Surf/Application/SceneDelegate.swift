//
//  SceneDelegate.swift
//  Surf
//
//  Created by Егор  Хлямов on 01.08.2023.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate{
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let x = 2
        if x == 2{
            guard let windowScene = (scene as? UIWindowScene) else { return }
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = MainViewControllerAssembly().create()
            self.window = window
            window.makeKeyAndVisible()
        }
        else{
            guard let windowScene = (scene as? UIWindowScene) else { return }
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = ViewController()
            self.window = window
            window.makeKeyAndVisible()
        }

    }
    }


