//
//  KeypadButton.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/4/30.
//

import SwiftUI

struct KeypadButton: View {

    private let tapAction: (KeypadModel.PadBottunInfo) -> ()
    private let longTapAction: (KeypadModel.PadBottunInfo) -> ()
    private let padButtonInfo: KeypadModel.PadBottunInfo
    @State private var pressed: Bool = false

    init(padButtonInfo: KeypadModel.PadBottunInfo, tapAction: @escaping (KeypadModel.PadBottunInfo) -> (), longTapAction: @escaping (KeypadModel.PadBottunInfo) -> ()) {
        self.tapAction = tapAction
        self.longTapAction = longTapAction
        self.padButtonInfo = padButtonInfo
    }
    
    @ViewBuilder
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                VStack(alignment: .center, spacing: 0, content: {
                    Spacer()
                    Text(padButtonInfo.content)
                        .fontWeight(.regular)
                        .font(.system(size: 40))
                    Text(padButtonInfo.subContent)
                        .fontWeight(.light)
                    Spacer()
                })
                Spacer()
            }
            .background(!pressed ? Color.white.opacity(0.01) : BaseColor.blue)

            .frame(width: geometry.size.width, height: geometry.size.height)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0.0)
                    .onChanged { _ in self.pressed = true }
                    .onEnded { _ in self.pressed = false }
            )
            .simultaneousGesture(
                LongPressGesture()
                    .onChanged({ bool in
                        // 使用 LongPressGesture 的 onChanged 來當作 TapGesture
                        ImpactFeedbackManager.impactOccurred()
                        tapAction(padButtonInfo)
                    })
                    .onEnded({ _ in
                        if padButtonInfo.enableSubContent {
                            ImpactFeedbackManager.impactOccurred()
                            longTapAction(padButtonInfo)
                        }
                        self.pressed = false
                    }))
            .foregroundColor(!pressed ? BaseColor.blue : Color.white)
            .clipShape(Circle())
        }
    }
}
