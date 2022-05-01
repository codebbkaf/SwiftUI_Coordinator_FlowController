//
//  KeypadView.swift
//  SwiftUIBaseOnFlowController
//
//  Created by CI-Red.Tseng on 2022/4/29.
//

import SwiftUI

struct KeypadView: View {
    
    @ObservedObject var viewModel: KeypadViewModel

    var body: some View {
        keypadBody
            .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
    }
    
    @ViewBuilder
    var keypadBody: some View {
        VStack {
            Rectangle()
                .overlay(
                    Text(viewModel.inputText)
                        .font(.system(size: 42))
                        .fontWeight(.medium)
                        .scaledToFit()
                        .minimumScaleFactor(0.2)
                        .lineLimit(1)
                        .foregroundColor(BaseColor.inputTextColot)
                )
                .frame(minWidth: 80, minHeight: 60, maxHeight: 60, alignment: .center)
                .foregroundColor(Color.clear)
            GeometryReader { geometry in
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(viewModel.padBottunInfos) { padButtonInfo in
                        KeypadButton(padButtonInfo: padButtonInfo, tapAction: { padButtonInfo in
                            viewModel.inputText += padButtonInfo.content
                        }, longTapAction: { padButtonInfo in
                            viewModel.inputText += padButtonInfo.subContent
                        })
                        .aspectRatio(contentMode: .fit)
                    }
                    Image("contacts-contacts_fill_symbol")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(BaseColor.blue)
                        .frame(width: 40, height: 40, alignment: .center)
                        .onTapGesture {
                            print("system_message contacts tap")
                            viewModel.onGoContactView?()
                        }
                    Circle()
                        .frame(width: (geometry.size.width / 3) * 0.8, height: geometry.size.width / 3 * 0.8, alignment: .center)
                        .foregroundColor(BaseColor.green)
                        .overlay(
                            Image("call-call_fill_symbol")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32, alignment: .center)
                                .foregroundColor(Color.white)
                        )
                    Image("backspace-backspace_fill_symbol")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(BaseColor.blue)
                        .frame(width: 40, height: 40, alignment: .center)
                        .simultaneousGesture(
                            LongPressGesture()
                                .onChanged({ bool in
                                    ImpactFeedbackManager.impactOccurred()
                                    if viewModel.inputText.count > 0 {
                                        viewModel.inputText.removeLast()
                                    }
                                })
                                .onEnded({ _ in
                                    ImpactFeedbackManager.impactOccurred()
                                    viewModel.inputText = ""
                                }))
                }
            }
            Spacer(minLength: 30)
        }
    }
}
