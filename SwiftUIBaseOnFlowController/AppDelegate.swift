//
//  AppDelegate.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/5/1.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    private(set) lazy var appFlow: AppFlowController = {
        if let window = self.window {
            return AppFlowController(factory: AppFlowFactory())
        }
        fatalError("AppDelegate.window is not initiated yet.")
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAppWindow()
        return true
    }
    
    private func setupAppWindow() {
        /// 1. Capture the scene
        self.window = UIWindow(frame: UIScreen.main.bounds)

        /// 2. Create a view hierarchy programmatically
        let viewController = appFlow
        appFlow.start()

        /// 3. Set the root view controller of the window with your view controller
        window?.rootViewController = viewController

        /// 4. Set the window and call makeKeyAndVisible()
        window?.makeKeyAndVisible()

        /// 5. Load initialization required contents
//        let appInitializationLoader = appUtility.makeAppInitializationLoader()
//        appInitializationLoader.doAllInitializationStuff()
    }


}

