//
//  SettingFlowFactory.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/5/2.
//

import SwiftUI

protocol SettingFlowFactoryProtocol {
    func makeSettingHostingController() -> UIHostingController<SettingView>
}

struct SettingFlowFactory: SettingFlowFactoryProtocol {
    func makeSettingHostingController() -> UIHostingController<SettingView> {
        UIHostingController(rootView: SettingView())
    }
}
