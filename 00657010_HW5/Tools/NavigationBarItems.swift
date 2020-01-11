//
//  NavigationBarItems.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/6.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import Foundation
import SwiftUI

struct BackButton: View
{
    var unit: CGFloat
    var body: some View
    {
        HStack
        {
            Image(systemName: "delete.left")
            .padding(.leading, 5)
            Text("Back")
            .font(Font.system(size:20))
            .fontWeight(.semibold)
            .padding(.trailing, 5)
        }
        .foregroundColor(Color.blue)
        .background(Color.white)
        .cornerRadius(40)
    }
}
struct SearchButton: View
{
    @Binding var dataComplete: Bool
    @Binding var showSearch: Bool
    @Binding var searchTerm: String
    var body: some View
    {
        Group
        {
            if(self.dataComplete)
            {
                Button(action:
                {
                    self.showSearch.toggle()
                    if(self.showSearch == false)
                    {
                        self.searchTerm = ""
                    }
                    
                })
                {
                    Text("Search")
                    .foregroundColor(.blue)
                    
                }
            }
        }
    }
}

