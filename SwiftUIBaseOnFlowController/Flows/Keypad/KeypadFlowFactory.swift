//
//  KeypadFlowFactory.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/5/2.
//

import SwiftUI

protocol KeypadFlowFactoryProtocol {
    func makeKeypadViewModel() -> KeypadViewModel
    func makeKeypadHostingController(viewModel: KeypadViewModel) -> UIHostingController<KeypadView>
}

struct KeypadFlowFactory: KeypadFlowFactoryProtocol {
    func makeKeypadViewModel() -> KeypadViewModel {
        KeypadViewModel()
    }
    
    func makeKeypadHostingController(viewModel: KeypadViewModel) -> UIHostingController<KeypadView> {
        UIHostingController(rootView: KeypadView(viewModel: viewModel))
    }
}
