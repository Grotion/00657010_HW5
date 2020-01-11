//
//  StatsHomePage.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/28.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI
import AVFoundation
import AVKit

struct StatsHomePage: View
{
    let item = ["F1", "NBA", "NFL"]
    let fontColor = [Color.red, Color.blue, Color.orange]
    let urlString = [["https://www.youtube.com/watch?v=KDu9wvznEX0", "https://www.youtube.com/watch?v=5DKs9le5Mwo", ""], ["https://www.youtube.com/watch?v=Tn70NxIMk2Q"], ["https://www.youtube.com/watch?v=pvKBdrx4quA"]]
    @State private var selectedItem = 0
    @State private var showVideo = false
    @State private var showF1Pic = true
    @State private var showNBAPic = false
    @State private var showNFLPic = false
    //let player: AVPlayerController
    //@State var looper: AVPlayerLooper?
    var showMusicBar: Bool
    var body: some View
    {
        GeometryReader
        {
            geometry in
            NavigationView
            {
                ZStack
                {
                    Image("StatsBackground")
                    .resizable()
                    .opacity(0.5)
                    .frame(width: geometry.size.width)
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    VStack
                    {
                        Text(self.item[self.selectedItem])
                        .font(Font.custom("Snell Roundhand", size: geometry.size.width * 80 / 414))
                        .fontWeight(.bold)
                        .foregroundColor(self.fontColor[self.selectedItem])
                        .padding(EdgeInsets(top: geometry.size.width * 10 / 414, leading: geometry.size.width * 10 / 414, bottom: -geometry.size.width * 60 / 414, trailing: geometry.size.width * 10 / 414))
                        .animation(nil)
                        HStack(alignment: .center)
                        {
                            Button(action:
                            {
                                print("original select: \(self.item[self.selectedItem])(\(self.selectedItem))")
                                withAnimation(.easeInOut(duration: 1))
                                {
                                    if(self.selectedItem == 0)
                                    {
                                        self.selectedItem = 2
                                    }
                                    else
                                    {
                                        self.selectedItem = self.selectedItem - 1
                                    }
                                    if(self.selectedItem == 0)
                                    {
                                        self.showF1Pic = true
                                        self.showNBAPic = false
                                        self.showNFLPic = false
                                    }
                                    else if(self.selectedItem == 1)
                                    {
                                        self.showF1Pic = false
                                        self.showNBAPic = true
                                        self.showNFLPic = false
                                    }
                                    else if(self.selectedItem == 2)
                                    {
                                        self.showF1Pic = false
                                        self.showNBAPic = false
                                        self.showNFLPic = true
                                    }
                                }
                                print("change select: \(self.item[self.selectedItem])(\(self.selectedItem))")
                            })
                            {
                                Image("leftArrow")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: geometry.size.width * 40 / 414, height: geometry.size.width * 40 / 414)
                                .scaledToFit()
                            }
                            /*Image(self.item[self.selectedItem])
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: geometry.size.width * 3 / 4, height: geometry.size.width / 2)
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 20)*/
                            if(self.showF1Pic == true)
                            {
                                Image("F1")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: geometry.size.width * 3 / 4, height: geometry.size.width / 2)
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 20)
                                .transition(.opacity)
                            }
                            if(self.showNBAPic == true)
                            {
                                Image("NBA")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: geometry.size.width * 3 / 4, height: geometry.size.width / 2)
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 20)
                                .transition(.opacity)
                            }
                            if(self.showNFLPic == true)
                            {
                                Image("NFL")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: geometry.size.width * 3 / 4, height: geometry.size.width / 2)
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 20)
                                .transition(.opacity)
                            }
                            Button(action:
                            {
                                print("original select: \(self.item[self.selectedItem])(\(self.selectedItem))")
                                withAnimation(.easeInOut(duration: 1))
                                {
                                    if(self.selectedItem == 2)
                                    {
                                        self.selectedItem = 0
                                    }
                                    else
                                    {
                                        self.selectedItem = self.selectedItem + 1
                                    }
                                    if(self.selectedItem == 0)
                                    {
                                        self.showF1Pic = true
                                        self.showNBAPic = false
                                        self.showNFLPic = false
                                    }
                                    else if(self.selectedItem == 1)
                                    {
                                        self.showF1Pic = false
                                        self.showNBAPic = true
                                        self.showNFLPic = false
                                    }
                                    else if(self.selectedItem == 2)
                                    {
                                        self.showF1Pic = false
                                        self.showNBAPic = false
                                        self.showNFLPic = true
                                    }
                                }
                                print("change select: \(self.item[self.selectedItem])(\(self.selectedItem))")
                            })
                            {
                                Image("rightArrow")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: geometry.size.width * 40 / 414, height: geometry.size.width * 40 / 414)
                                .scaledToFit()
                            }
                        }
                        Button(action:{self.showVideo = true})
                        {
                            StrokeText(text: "About", width: geometry.size.width * 0.5 / 414, color: .black)
                            .foregroundColor(.orange)
                            .font(.system(size: geometry.size.width * 18 / 414, weight: .bold))
                        }
                        .frame(height:geometry.size.width * 20 / 414)
                        .sheet(isPresented: self.$showVideo)
                        {
                            SafariViewController(url: URL(string: self.urlString[self.selectedItem][0])!)
                            //player.play()
                        }
                        NavigationLink(destination: StatsCategory(selectedItem: self.$selectedItem, showMusicBar: self.showMusicBar))
                        {
                            Text("Select")
                            .font(Font.system(size:geometry.size.width * 40 / 414))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width:geometry.size.width * 3 / 4, height:geometry.size.width * 60 / 414)
                            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.red))
                            .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: 0, trailing: geometry.size.width * 10 / 414))
                        }
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct StatsHomePage_Previews: PreviewProvider
{
    static var previews: some View
    {
        StatsHomePage(showMusicBar: true)
    }
}
