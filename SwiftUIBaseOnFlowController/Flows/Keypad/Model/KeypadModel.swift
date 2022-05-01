//
//  KeypadModel.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/4/29.
//

import Foundation

struct KeypadModel {
    var padBottuns: Array<PadBottunInfo>
    
    struct PadBottunInfo: Identifiable {
        let id: String = UUID().uuidString
        let content: String
        let subContent: String
        let enableSubContent: Bool
        
        init(content: String, subContent: String, enableSubContent: Bool = false) {
            self.content = content
            self.subContent = subContent
            self.enableSubContent = enableSubContent
        }
    }
    
    init() {
        padBottuns = [
            PadBottunInfo(content: "1", subContent: ""),
            PadBottunInfo(content: "2", subContent: "ABC"),
            PadBottunInfo(content: "3", subContent: "DEF"),
            PadBottunInfo(content: "4", subContent: "GHI"),
            PadBottunInfo(content: "5", subContent: "JKL"),
            PadBottunInfo(content: "6", subContent: "MNO"),
            PadBottunInfo(content: "7", subContent: "PQRS"),
            PadBottunInfo(content: "8", subContent: "TUV"),
            PadBottunInfo(content: "9", subContent: "WXYZ"),
            PadBottunInfo(content: "*", subContent: ""),
            PadBottunInfo(content: "0", subContent: "+", enableSubContent: true),
            PadBottunInfo(content: "#", subContent: ""),
        ]
    }
}
