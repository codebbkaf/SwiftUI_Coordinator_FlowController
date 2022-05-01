//
//  FlowController.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/5/1.
//

import UIKit

public class FlowController: UIViewController, FlowControlable {
    public func start(option: CoordinatorStartOption? = nil, fromLaunch: Bool = false) {
        fatalError("Should always override this method before using it.")
    }

    open var rootPresentingViewController: UIViewController? {
        fatalError("Should override this property to make sure view stack is correct.")
    }
}
