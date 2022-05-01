//
//  Presentable.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/5/2.
//

import UIKit

public protocol Presentable {
    func toPresent() -> UIViewController
}

extension UIViewController: Presentable {
    
    public func toPresent() -> UIViewController {
        return self
    }
}
