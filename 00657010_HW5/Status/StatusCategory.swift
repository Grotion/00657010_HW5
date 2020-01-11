//
//  StatsCategory.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct StatsCategory: View
{
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedItem: Int
    let categorys = [["Competitor", "Team Profile"], ["Daily Schedule", "Free Agent", "Season", "Leader"], ["Standings", "Drafts", "Team Profile"]]
    let picShow = [["F1Competitor", "F1TeamProfile"],["NBADailySchedule", "NBAFreeAgent", "NBASeason", "NBALeader"], ["NFLStandings", "NFLDrafts", "NFLTeamProfile"]]
    var showMusicBar: Bool
    var body: some View
    {
        GeometryReader
        {
            geometry in
            ZStack
            {
                Image("StatsBackground")
                .resizable()
                .opacity(0.5)
                .frame(width: geometry.size.width)
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                ScrollView
                {
                    /*VStack(alignment: .center, spacing: geometry.size.width * 20 / 414)
                    {
                        ForEach(0..<Lists[self.selectedItem].count, id: \.self)
                        {
                            (index) in
                            NavigationLink(destination: Lists[self.selectedItem][index].destination)
                            {
                                ZStack(alignment: .bottomLeading)
                                {
                                    Image(self.picShow[self.selectedItem][index])
                                    .resizable()
                                    .renderingMode(.original)
                                    .scaledToFill()
                                    .frame(width: geometry.size.width * 8 / 9, height: geometry.size.width * 2 / 3)
                                    .clipped()
                                    Text(self.categorys[self.selectedItem][index])
                                    .font(Font.system(size:geometry.size.width * 30 / 414))
                                    .fontWeight(.bold)
                                    .foregroundColor(.red)
                                    .background(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: geometry.size.width * 3 / 414, trailing: 0))
                                    Path(CGRect(x: 0,y:0,width:geometry.size.width * 8 / 9,height:geometry.size.width * 2 / 3)).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414))
                                }
                            }
                        }
                        Spacer()
                        .frame(height: geometry.size.width / 8)
                    }
                    .offset(x:geometry.size.width / 18, y:0)*/
                    if(self.selectedItem == 0)
                    {
                        VStack(alignment: .center, spacing: geometry.size.width * 20 / 414)
                        {
                            Group
                            {
                                NavigationLink(destination: F1CompetitorList(showMusicBar: self.showMusicBar))
                                {
                                    ZStack(alignment: .bottomLeading)
                                    {
                                        Image(self.picShow[0][0])
                                        .resizable()
                                        .renderingMode(.original)
                                        .scaledToFill()
                                        .frame(width: geometry.size.width * 8 / 9, height: geometry.size.width * 2 / 3)
                                        .clipped()
                                        Text("\(self.categorys[0][0])")
                                        .font(Font.system(size:geometry.size.width * 30 / 414))
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                        .background(Color.white)
                                        .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: geometry.size.width * 3 / 414, trailing: 0))
                                        Path(CGRect(x: 0,y:0,width:geometry.size.width * 8 / 9,height:geometry.size.width * 2 / 3)).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414))
                                    }
                                }
                                NavigationLink(destination: F1TeamProfileList(showMusicBar: self.showMusicBar))
                                {
                                    ZStack(alignment: .bottomLeading)
                                    {
                                        Image(self.picShow[0][1])
                                        .resizable()
                                        .renderingMode(.original)
                                        .scaledToFill()
                                        .frame(width: geometry.size.width * 8 / 9, height: geometry.size.width * 2 / 3)
                                        .clipped()
                                        Text("\(self.categorys[0][1])")
                                        .font(Font.system(size:geometry.size.width * 30 / 414))
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                        .background(Color.white)
                                        .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: geometry.size.width * 3 / 414, trailing: 0))
                                        Path(CGRect(x: 0,y:0,width:geometry.size.width * 8 / 9,height:geometry.size.width * 2 / 3)).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414))
                                    }
                                }
                            }
                            Spacer()
                            .frame(height: geometry.size.width / 8)
                        }
                        .offset(x:geometry.size.width / 18, y:0)
                    }
                    if(self.selectedItem == 1)
                    {
                        VStack(alignment: .center, spacing: geometry.size.width * 20 / 414)
                        {
                            Group
                            {
                                NavigationLink(destination: NBADailyScheduleList(showMusicBar: self.showMusicBar))
                                {
                                    ZStack(alignment: .bottomLeading)
                                    {
                                        Image(self.picShow[1][0])
                                        .resizable()
                                        .renderingMode(.original)
                                        .scaledToFill()
                                        .frame(width: geometry.size.width * 8 / 9, height: geometry.size.width * 2 / 3)
                                        .clipped()
                                        Text("\(self.categorys[1][0])")
                                        .font(Font.system(size:geometry.size.width * 30 / 414))
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                        .background(Color.white)
                                        .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: geometry.size.width * 3 / 414, trailing: 0))
                                        Path(CGRect(x: 0,y:0,width:geometry.size.width * 8 / 9,height:geometry.size.width * 2 / 3)).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414))
                                    }
                                }
                                NavigationLink(destination: NBAFreeAgentList(showMusicBar: self.showMusicBar))
                                {
                                    ZStack(alignment: .bottomLeading)
                                    {
                                        Image(self.picShow[1][1])
                                        .resizable()
                                        .renderingMode(.original)
                                        .scaledToFill()
                                        .frame(width: geometry.size.width * 8 / 9, height: geometry.size.width * 2 / 3)
                                        .clipped()
                                        Text("\(self.categorys[1][1])")
                                        .font(Font.system(size:geometry.size.width * 30 / 414))
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                        .background(Color.white)
                                        .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: geometry.size.width * 3 / 414, trailing: 0))
                                        Path(CGRect(x: 0,y:0,width:geometry.size.width * 8 / 9,height:geometry.size.width * 2 / 3)).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414))
                                    }
                                }
                                NavigationLink(destination: NBASeasonList(showMusicBar: self.showMusicBar))
                                {
                                    ZStack(alignment: .bottomLeading)
                                    {
                                        Image(self.picShow[1][2])
                                        .resizable()
                                        .renderingMode(.original)
                                        .scaledToFill()
                                        .frame(width: geometry.size.width * 8 / 9, height: geometry.size.width * 2 / 3)
                                        .clipped()
                                        Text("\(self.categorys[1][2])")
                                        .font(Font.system(size:geometry.size.width * 30 / 414))
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                        .background(Color.white)
                                        .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: geometry.size.width * 3 / 414, trailing: 0))
                                        Path(CGRect(x: 0,y:0,width:geometry.size.width * 8 / 9,height:geometry.size.width * 2 / 3)).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414))
                                    }
                                }
                                NavigationLink(destination: NBALeaderList(showMusicBar: self.showMusicBar))
                                {
                                    ZStack(alignment: .bottomLeading)
                                    {
                                        Image(self.picShow[1][3])
                                        .resizable()
                                        .renderingMode(.original)
                                        .scaledToFill()
                                        .frame(width: geometry.size.width * 8 / 9, height: geometry.size.width * 2 / 3)
                                        .clipped()
                                        Text("\(self.categorys[1][3])")
                                        .font(Font.system(size:geometry.size.width * 30 / 414))
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                        .background(Color.white)
                                        .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: geometry.size.width * 3 / 414, trailing: 0))
                                        Path(CGRect(x: 0,y:0,width:geometry.size.width * 8 / 9,height:geometry.size.width * 2 / 3)).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414))
                                    }
                                }
                            }
                            Spacer()
                            .frame(height: geometry.size.width / 8)
                        }
                        .offset(x:geometry.size.width / 18, y:0)
                    }
                    if(self.selectedItem == 2)
                    {
                        VStack(alignment: .center, spacing: geometry.size.width * 20 / 414)
                        {
                            Group
                            {
                                NavigationLink(destination: NFLStandingsList(showMusicBar: self.showMusicBar))
                                {
                                    ZStack(alignment: .bottomLeading)
                                    {
                                        Image(self.picShow[2][0])
                                        .resizable()
                                        .renderingMode(.original)
                                        .scaledToFill()
                                        .frame(width: geometry.size.width * 8 / 9, height: geometry.size.width * 2 / 3)
                                        .clipped()
                                        Text("\(self.categorys[2][0])")
                                        .font(Font.system(size:geometry.size.width * 30 / 414))
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                        .background(Color.white)
                                        .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: geometry.size.width * 3 / 414, trailing: 0))
                                        Path(CGRect(x: 0,y:0,width:geometry.size.width * 8 / 9,height:geometry.size.width * 2 / 3)).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414))
                                    }
                                }
                                NavigationLink(destination: NFLDraftList(showMusicBar: self.showMusicBar))
                                {
                                    ZStack(alignment: .bottomLeading)
                                    {
                                        Image(self.picShow[2][1])
                                        .resizable()
                                        .renderingMode(.original)
                                        .scaledToFill()
                                        .frame(width: geometry.size.width * 8 / 9, height: geometry.size.width * 2 / 3)
                                        .clipped()
                                        Text("\(self.categorys[2][1])")
                                        .font(Font.system(size:geometry.size.width * 30 / 414))
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                        .background(Color.white)
                                        .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: geometry.size.width * 3 / 414, trailing: 0))
                                        Path(CGRect(x: 0,y:0,width:geometry.size.width * 8 / 9,height:geometry.size.width * 2 / 3)).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414))
                                    }
                                }
                                NavigationLink(destination: NFLTeamProfileList(showMusicBar: self.showMusicBar))
                                {
                                    ZStack(alignment: .bottomLeading)
                                    {
                                        Image(self.picShow[2][2])
                                        .resizable()
                                        .renderingMode(.original)
                                        .scaledToFill()
                                        .frame(width: geometry.size.width * 8 / 9, height: geometry.size.width * 2 / 3)
                                        .clipped()
                                        Text("\(self.categorys[2][2])")
                                        .font(Font.system(size:geometry.size.width * 30 / 414))
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                        .background(Color.white)
                                        .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: geometry.size.width * 3 / 414, trailing: 0))
                                        Path(CGRect(x: 0,y:0,width:geometry.size.width * 8 / 9,height:geometry.size.width * 2 / 3)).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414))
                                    }
                                }
                            }
                            Spacer()
                            .frame(height: geometry.size.width / 8)
                        }
                        .offset(x:geometry.size.width / 18, y:0)
                    }
                }
            }
            .navigationBarItems(leading: Button(action:
            {
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)})
        }
    }
}

struct StatsCategory_Previews: PreviewProvider
{
    static var previews: some View
    {
        StatsCategory(selectedItem: .constant(0), showMusicBar: true)
    }
}
