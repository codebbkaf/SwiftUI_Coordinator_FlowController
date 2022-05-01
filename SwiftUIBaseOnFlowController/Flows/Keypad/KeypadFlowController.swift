//
//  NotificationFlowController.swift
//  SwiftUIBaseOnFlowController
//
//  Created by Red on 2022/5/1.
//

import UIKit
import Foundation
import ContactsUI
import Contacts
import SwiftUI

protocol KeypadFlow: FlowControlable {}

final class KeypadFlowController: FlowController, KeypadFlow {

    private let factory: KeypadFlowFactoryProtocol
    
    override var rootPresentingViewController: UIViewController? { nil }
    private let navigation = UINavigationController()
    
    init(factory: KeypadFlowFactoryProtocol) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seutpUI()
    }

    private func seutpUI() {
        navigation.navigationBar.isHidden = true
        add(navigation)
        start()
    }

    override func start(option: CoordinatorStartOption? = nil, fromLaunch: Bool = false) {
        let viewModel = factory.makeKeypadViewModel()
        viewModel.onGoContactView = { [weak self] in
            self?.presentContactView()
        }
        let hostingViewController = factory.makeKeypadHostingController(viewModel: viewModel)
        navigation.viewControllers = [hostingViewController.toPresent()]
    }
    
    private func presentContactView() {
        let cnContactPickerViewController = CNContactPickerViewController()
        cnContactPickerViewController.delegate = self
        present(cnContactPickerViewController, animated: true, completion: nil)
    }
}

extension KeypadFlowController: CNContactPickerDelegate {
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        print("system_message didSelect contact: \(contact)")
    }
//    實作這個 method 會自動開啟多選模式
//    public func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
//        print("system_message didSelect contacts: \(contacts)")
//
//    }
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
        print("system_message didSelect contactProperty: \(contactProperty)")
    }
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("system_message contactPickerDidCancel")
    }
}
