//
//  LoadingViewController.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/2.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import UIKit
import SwiftUI
import Foundation
import NVActivityIndicatorView

struct LoadingViewController: UIViewRepresentable
{
    var loading : NVActivityIndicatorView

    func makeUIView(context: UIViewRepresentableContext<LoadingViewController>) -> UIView
    {

        let view = UIView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loading)
        NSLayoutConstraint.activate([
            loading.widthAnchor.constraint(equalToConstant: 80),
            loading.heightAnchor.constraint(equalToConstant: 80),
            loading.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loading.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        loading.startAnimating()
        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LoadingViewController>)
    {
    }
}
