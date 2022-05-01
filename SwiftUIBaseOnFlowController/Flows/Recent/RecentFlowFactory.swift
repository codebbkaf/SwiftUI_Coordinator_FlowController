//
//  RecentFlowFactory.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/5/2.
//

import SwiftUI

protocol RecentFlowFactoryProtocol: AnyObject {
    func makeRecentHostingController() -> UIHostingController<RecentView>
}

final class RecentFlowFactory: RecentFlowFactoryProtocol {
    
    func makeRecentHostingController() -> UIHostingController<RecentView> {
        let recentView = RecentView()
        let hostingViewController = UIHostingController(rootView: recentView)
        return hostingViewController
    }
}
