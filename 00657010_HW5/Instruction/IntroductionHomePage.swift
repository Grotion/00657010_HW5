//
//  IntroductionHomePAge.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/29.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct IntroductionHomePage: View
{
    @State private var showIntroduction: Bool = false
    @State private var showInstruction: Bool = false
    var body: some View
    {
        GeometryReader
        {
            geometry in
            ZStack
            {
                Image("introductionBackground")
                .resizable()
                .opacity(0.3)
                .frame(width: geometry.size.width)
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                VStack
                {
                    Text("Insight Sports")
                    .font(Font.custom("Snell Roundhand", size: geometry.size.width * 50 / 414))
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                    .multilineTextAlignment(.center)
                    .frame(width:geometry.size.width * 4 / 5, height: geometry.size.width * 80 / 414)
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 2 / 414)))
                    Image("MainPic")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: geometry.size.width * 3 / 4, height: geometry.size.width * 3 / 4)
                    .scaledToFit()
                    .clipped()
                    StrokeText(text: "Long Press To Show Introduction", width: geometry.size.width * 0.5 / 414, color: .white)
                    .foregroundColor(.blue)
                    .font(.system(size: geometry.size.width * 18 / 414, weight: .bold))
                    .onLongPressGesture(minimumDuration: 1.5)
                    {
                        self.showIntroduction = true
                        self.showInstruction = false
                    }
                    .padding(EdgeInsets(top: geometry.size.width * 20 / 414, leading: 0, bottom: geometry.size.width * 10 / 414, trailing: 0))
                    StrokeText(text: "Press Longer To Show Instruction", width: geometry.size.width * 0.5 / 414, color: .black)
                    .foregroundColor(.purple)
                    .font(.system(size: geometry.size.width * 18 / 414, weight: .bold))
                    .onLongPressGesture(minimumDuration: 3)
                    {
                        self.showIntroduction = false
                        self.showInstruction = true
                    }
                }
                if(self.showIntroduction == true)
                {
                    ZStack(alignment: .topLeading)
                    {
                        Text("Introduction!\nSome introduction\nSome introduction\nSome introduction\nSome introduction\nSome introduction")
                        .font(Font.system(size:geometry.size.width * 20 / 414))
                        .fontWeight(.bold)
                        .frame(width: geometry.size.width * 3 / 4)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: geometry.size.width * 20 / 414, leading: geometry.size.width * 10 / 414, bottom: geometry.size.width * 20 / 414, trailing: geometry.size.width * 10 / 414))
                        Button(action:{self.showIntroduction = false})
                        {
                            Image(systemName: "xmark.circle")
                            .resizable()
                            .renderingMode(.original)
                            .background(Color.white)
                            .frame(width: geometry.size.width * 30 / 414, height: geometry.size.width * 30 / 414)
                            .clipShape(Circle())
                            .padding(EdgeInsets(top: geometry.size.width * 5 / 414, leading: geometry.size.width * 5 / 414, bottom: 0, trailing: 0))
                        }
                        
                    }
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.blue))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414)))
                    .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: 0, trailing: geometry.size.width * 10 / 414))
                }
                if(self.showInstruction == true)
                {
                    ZStack(alignment: .topLeading)
                    {
                        Text("Instruction!\nSome instruction\nSome instruction\nSome instruction\nSome instruction\nSome instruction")
                        .font(Font.system(size:geometry.size.width * 20 / 414))
                        .fontWeight(.bold)
                        .frame(width: geometry.size.width * 3 / 4)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: geometry.size.width * 20 / 414, leading: geometry.size.width * 10 / 414, bottom: geometry.size.width * 20 / 414, trailing: geometry.size.width * 10 / 414))
                        Button(action:{self.showInstruction = false})
                        {
                            Image(systemName: "xmark.circle")
                            .resizable()
                            .renderingMode(.original)
                            .background(Color.white)
                            .frame(width: geometry.size.width * 30 / 414, height: geometry.size.width * 30 / 414)
                            .clipShape(Circle())
                            .padding(EdgeInsets(top: geometry.size.width * 5 / 414, leading: geometry.size.width * 5 / 414, bottom: 0, trailing: 0))
                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.purple))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414)))
                    .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: 0, trailing: geometry.size.width * 10 / 414))
                }
            }
        }
    }
}

struct IntroductionHomePage_Previews: PreviewProvider
{
    static var previews: some View
    {
        IntroductionHomePage()
    }
}
