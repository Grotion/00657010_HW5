//
//  SafariViewController.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/30.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation
import SafariServices
import SwiftUI

struct SafariViewController: UIViewControllerRepresentable
{
    var url: URL
    func makeUIViewController(context: Context) -> SFSafariViewController
    {
        SFSafariViewController(url: url)
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context)
    {
    }
}
