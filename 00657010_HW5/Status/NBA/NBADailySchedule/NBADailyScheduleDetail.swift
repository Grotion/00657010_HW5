//
//  NBADailyScheduleDetail.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI
 
struct NBADailyScheduleDetail: View
{
    @Environment(\.presentationMode) var presentationMode
    @Binding var dataComplete: Bool
    var dailyScheduleGame: NBADailySchedule_game
    var body: some View
    {
        GeometryReader
        {
            geometry in
            ZStack
            {
                Image("detailBackground")
                .resizable()
                .opacity(0.3)
                .frame(width: geometry.size.width)
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                ScrollView
                {
                    VStack(alignment: .center)
                    {
                        HStack(alignment: .center)
                        {
                            VStack(alignment: .center)
                            {
                                Text("Home")
                                .font(Font.system(size:geometry.size.width * 30 / 414))
                                .fontWeight(.bold)
                                Image("\(self.dailyScheduleGame.home.name)")
                                .resizable()
                                .renderingMode(.original)
                                .scaledToFit()
                                .frame(width: geometry.size.width * 100 / 414, height:geometry.size.width * 100 / 414)
                                Text(String(self.dailyScheduleGame.home_points))
                                .font(Font.system(size:geometry.size.width * 30 / 414))
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                            }
                            Text("VS")
                            .font(Font.system(size:geometry.size.width * 20 / 414))
                            .fontWeight(.bold)
                            VStack(alignment: .center)
                            {
                                Text("AWAY")
                                .font(Font.system(size:geometry.size.width * 30 / 414))
                                .fontWeight(.bold)
                                Image("\(self.dailyScheduleGame.away.name)")
                                .resizable()
                                .renderingMode(.original)
                                .scaledToFit()
                                .frame(width: geometry.size.width * 100 / 414, height:geometry.size.width * 100 / 414)
                                Text(String(self.dailyScheduleGame.away_points))
                                .font(Font.system(size:geometry.size.width * 30 / 414))
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                            }
                        }
                        VStack(alignment: .leading)
                        {
                            HStack
                            {
                                Text("Venue: ")
                                Text("\(self.dailyScheduleGame.venue.name)")
                            }
                            ForEach(self.dailyScheduleGame.broadcasts.indices, id: \.self)
                            {
                                (index) in
                                HStack
                                {
                                    Text("Broadcast Network: ")
                                    Text("\(self.dailyScheduleGame.broadcasts[index].network)")
                                }
                            }
                        }
                        .frame(maxWidth: geometry.size.width)
                        Spacer()
                        .frame(height: geometry.size.width / 8)
                    }
                    .lineLimit(Int.max)
                }
            }
            .navigationBarItems(leading: Button(action:
            {
                self.dataComplete = false
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)})
        }
    }
}
 
struct NBADailyScheduleDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        NBADailyScheduleDetail(dataComplete: .constant(true), dailyScheduleGame: NBADailySchedule_game(id: "123",status:"closed",coverage:"full",scheduled:"2019-12-25T17:00:00+00:00",home_points:102,away_points:118,track_on_court:true,sr_id:"sr:match:19097336",reference:"0021900455",time_zones: NBADailySchedule_game_timezone(venue:"US/Eastern",home:"US/Eastern",away:"US/Eastern"),venue: NBADailySchedule_game_venue(id:"123",name:"Scotiabank Arena",capacity:19800,address:"40 Bay Street",city:"Toronto",state:"ON",zip:"M5J 2X2",country:"CAN",sr_id:"sr:venue:6030"),broadcasts: [NBADailySchedule_game_broadcasts(network:"ESPN",type:"TV",locale:"National",channel:"206")],home: NBADailySchedule_game_home_away(name:"Toronto Raptors",alias:"TOR",id:"123",sr_id:"sr:team:3433",reference:"1610612761"),away: NBADailySchedule_game_home_away(name:"Boston Celtics",alias:"BOS",id:"123",sr_id:"sr:team:3422",reference:"1610612738")))
    }
}
