//
//  NavigationConfigurator.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/5.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import Foundation
import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable
{
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController
    {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>)
    {
        if let nc = uiViewController.navigationController
        {
            self.configure(nc)
        }
    }

}
