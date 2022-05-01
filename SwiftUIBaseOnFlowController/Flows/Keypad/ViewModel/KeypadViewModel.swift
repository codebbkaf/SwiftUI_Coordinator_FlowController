//
//  KeypadViewModel.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/4/29.
//

import SwiftUI

class KeypadViewModel: ObservableObject {
    
    // MARK: - 🔮 Intents(s)
    
    var onGoContactView: (() -> Void)?

    private let keypadModel = KeypadModel()
    
    @Published public var inputText = ""
    
    public var padBottunInfos: Array<KeypadModel.PadBottunInfo> {
        keypadModel.padBottuns
    }
}
