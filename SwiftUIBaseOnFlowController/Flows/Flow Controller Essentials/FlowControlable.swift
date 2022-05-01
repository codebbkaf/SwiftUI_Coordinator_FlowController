//
//  FlowControlable.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/5/1.
//

import UIKit

public protocol CoordinatorStartOption {}

public protocol FlowControlable: UIViewController {
    func add(_ child: UIViewController)
    func remove(_ child: UIViewController)
    func start()

    var rootPresentingViewController: UIViewController? { get }
}

public extension FlowControlable {

    func add(_ child: UIViewController) {
        addChild(child)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(child.view)
        child.didMove(toParent: self)

        NSLayoutConstraint.activate([
            child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            child.view.topAnchor.constraint(equalTo: view.topAnchor),
            child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func remove(_ child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
    func start() {
        start()
    }
}
