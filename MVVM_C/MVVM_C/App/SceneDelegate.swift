//
//  SceneDelegate.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        
        //AppCoordinator 생성, 첫 뷰 그리기
        appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator?.start()
    }
}

