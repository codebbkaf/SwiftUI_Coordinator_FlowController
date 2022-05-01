//
//  SettingFlowController.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/5/2.
//

import SwiftUI

protocol SettingFlow: FlowControlable {}

final class SettingFlowController: FlowController, SettingFlow {
    
    private let factory: SettingFlowFactoryProtocol
    
    override var rootPresentingViewController: UIViewController? { nil }
    private let navigation = UINavigationController()
    
    init(factory: SettingFlowFactoryProtocol) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigation.navigationBar.isHidden = true
        add(navigation)
        start()
    }
    
    override func start(option: CoordinatorStartOption? = nil, fromLaunch: Bool = false) {
        let hostingController = factory.makeSettingHostingController()
        navigation.viewControllers = [hostingController]
    }
}
