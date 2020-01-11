//
//  SearchBar.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/5.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable
{
    @Binding var text: String
    class Coordinator: NSObject, UISearchBarDelegate
    {
        @Binding var text: String
        init(text: Binding<String>)
        {
            _text = text
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
        {
            text = searchText
        }
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
        {
            searchBar.showsCancelButton = true
        }

        func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
        {
            searchBar.text = nil
            text = ""
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
        }
    }
    func makeCoordinator() -> SearchBar.Coordinator
    {
        return Coordinator(text: $text)
    }
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar
    {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>)
    {
        uiView.text = text
    }
}
