//
//  RecentFlowController.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/5/2.
//


import SwiftUI

protocol RecentFlow: FlowControlable {}

final class RecentFlowController: FlowController, RecentFlow {

    private let factory: RecentFlowFactoryProtocol
    
    override var rootPresentingViewController: UIViewController? { nil }
    private let navigation = UINavigationController()
    
    init(factory: RecentFlowFactoryProtocol) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        seutpUI()
    }

    private func seutpUI() {
        navigation.navigationBar.isHidden = true
        add(navigation)
        start()
    }

    override func start(option: CoordinatorStartOption? = nil, fromLaunch: Bool = false) {
        let hostingController = factory.makeRecentHostingController()
        navigation.viewControllers = [hostingController.toPresent()]
    }
}
