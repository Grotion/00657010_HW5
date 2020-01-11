//
//  ContentView.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/28.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct ContentView: View
{
    @State private var showPic = 0
    var body: some View
    {
        ZStack
        {
            VStack
            {
                Image("tesla")
                    .resizable()
                    .frame(width:100, height:100)
                    .scaledToFit()
                Button("Show!")
                {
                    self.showPic = 1
                }
            }
            if(self.showPic == 1)
            {
                VStack
                {
                    Text("Hello, World!")
                    .font(Font.system(size:40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.center)
                    Button("Close!")
                    {
                        self.showPic = 0
                    }
                }
                .frame(width:320, height:60)
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.yellow))
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
