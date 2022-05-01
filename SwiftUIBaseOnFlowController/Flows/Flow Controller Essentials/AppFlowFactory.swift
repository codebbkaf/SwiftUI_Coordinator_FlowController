//
//  AppFlowFactory.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/5/1.
//

import SwiftUI

protocol AppFlowFactoryProtocol {
    func makeKeypadFlow() -> KeypadFlow
    func makeRecentFlow() -> RecentFlow
    func makeSettingFlow() -> SettingFlow
}

struct AppFlowFactory: AppFlowFactoryProtocol {
    func makeKeypadFlow() -> KeypadFlow {
        let keypadFlow = KeypadFlowController(factory: KeypadFlowFactory())
        keypadFlow.tabBarItem = UITabBarItem(
            title: "數字鍵盤",
            image: UIImage(named: "dialpad-dialpad_symbol"),
            selectedImage: UIImage(named: "dialpad-dialpad_symbol")
        )
        return keypadFlow
    }
    
    func makeRecentFlow() -> RecentFlow {
        let recentFlow = RecentFlowController(factory: RecentFlowFactory())
        recentFlow.tabBarItem = UITabBarItem(
            title: "通話紀錄",
            image: UIImage(named: "history-history_symbol"),
            selectedImage: UIImage(named: "history-history_symbol")
        )
        return recentFlow
    }
    
    func makeSettingFlow() -> SettingFlow {
        let settingFlow = SettingFlowController(factory: SettingFlowFactory())
        settingFlow.tabBarItem = UITabBarItem(
            title: "設定",
            image: UIImage(named: "settings-settings_symbol"),
            selectedImage: UIImage(named: "settings-settings_symbol")
        )
        return settingFlow
    }
}
