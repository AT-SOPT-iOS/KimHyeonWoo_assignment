import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        // 1) UIScene 타입 확인
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // 2) SwiftUI 뷰 생성
        let homeView = HomeView()

        // 3) UIHostingController에 SwiftUI 뷰를 연결
        let hostingController = UIHostingController(rootView: homeView)

        // 4) UIWindow를 생성하고, 윈도우 씬에 연결
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = hostingController
        self.window = window
        window.makeKeyAndVisible()
    }
}
