//
//  SceneDelegate.swift
//  UIKitCrashCourse
//
//  Created by Deokhun KIM on 2023/03/06.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        //window Scene캡쳐, 기본적인 화면 영역이 됨
        //응용프로그램이 시작될때 가져온 창 화면으로 이동
        guard let windowScene = (scene as? UIWindowScene) else { return }
        // window에 할당
        self.window = UIWindow(windowScene: windowScene)
        //뷰 컨트롤러 연결
        let vc = PeopleViewController()
        
        //UINavigationController에 넣기 (NavigationStack, View같은 역할)
        let nav = UINavigationController(rootViewController: vc)
        
        //rootViewController 설정(프로그램 시작할때 처음으로 표시되는 뷰컨트롤러)
        self.window?.rootViewController = nav
        
        //-keyWindow: window가 여러개 존재할 때, 가장 앞쪽에 배치된 window를 `key window`라고 지칭
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

