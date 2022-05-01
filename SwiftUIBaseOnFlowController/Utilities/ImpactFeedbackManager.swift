//
//  ImpactFeedbackManager.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/5/1.
//

import SwiftUI

class ImpactFeedbackManager {
    static let impactMed = UIImpactFeedbackGenerator(style: .medium)
    static func impactOccurred() {
        impactMed.impactOccurred()
    }
}
