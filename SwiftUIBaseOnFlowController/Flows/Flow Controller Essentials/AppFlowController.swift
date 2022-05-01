//
//  AppFlowController.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/5/1.
//

import SwiftUI

final class AppFlowController: FlowController {
    
    private let factory: AppFlowFactoryProtocol
    private let tabBar = UITabBarController()
    
    private let keypad: KeypadFlow
    private let recent: RecentFlow
    private let setting: SettingFlow
    
    init(factory: AppFlowFactoryProtocol) {
        self.factory = factory
        keypad = factory.makeKeypadFlow()
        recent = factory.makeRecentFlow()
        setting = factory.makeSettingFlow()
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var rootPresentingViewController: UIViewController? { tabBar }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        guard let this = tabBar.selectedViewController else { return false }
        return this.prefersHomeIndicatorAutoHidden
    }
    
    override var childForStatusBarStyle: UIViewController? {
        tabBar.selectedViewController
    }
    
    override func start(option: CoordinatorStartOption? = nil, fromLaunch: Bool = false) {
        startMain(option: option as? AppRoute, fromLaunch: fromLaunch)
    }
    
    private func startMain(option: AppRoute?, fromLaunch: Bool) {
        add(tabBar)
        tabBar.viewControllers = [keypad, recent, setting]
        
        if let option = option {
            switch option {}
        }
    }
}
