//
//  NBASeasonDetail.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct NBASeasonDetail: View
{
    @Environment(\.presentationMode) var presentationMode
    @Binding var dataComplete: Bool
    var team: NBASeason_conferences_divisions_teams
    @State private var teamName = "Los Angeles Lakers"
    func setTeamName()
    {
        self.teamName = self.team.market + " " + self.team.name
    }
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
                        Image("\(self.teamName)")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .frame(width: geometry.size.width / 2, height:geometry.size.width / 2)
                        Text("\(self.teamName)")
                        .font(Font.system(size:geometry.size.width * 20 / 414))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: geometry.size.width)
                        .padding(.bottom, geometry.size.width * 20 / 414)
                        VStack(alignment: .leading, spacing: geometry.size.width * 10 / 414)
                        {
                            Group
                            {
                                HStack
                                {
                                    Text("Wins: ")
                                    Text("\(self.team.wins)")
                                }
                                HStack
                                {
                                    Text("Losses: ")
                                    Text("\(self.team.losses)")
                                }
                                HStack
                                {
                                    Text("Points For: ")
                                    Text("\(self.team.points_for, specifier: "%.2f")")
                                }
                                HStack
                                {
                                    Text("Point Against: ")
                                    Text("\(self.team.points_against, specifier: "%.2f")")
                                }
                                HStack
                                {
                                    Text("Point Difference: ")
                                    Text("\(self.team.point_diff, specifier: "%.2f")")
                                }
                                HStack
                                {
                                    Text("Division Rank: ")
                                    Text("\(self.team.calc_rank.div_rank)")
                                }
                                HStack
                                {
                                    Text("Conferrence Rank: ")
                                    Text("\(self.team.calc_rank.conf_rank)")
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
        .onAppear()
        {
            self.setTeamName()
        }
    }
}

struct NBASeasonDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        NBASeasonDetail(dataComplete: .constant(true), team: NBASeason_conferences_divisions_teams(id: "583ecb3a-fb46-11e1-82cb-f4ce4684ea4c", name: "Rockets", market: "Houston", wins: 10, losses: 10, win_pct: 10.0, points_for: 10.0, points_against: 10.0, point_diff: 10.0, sr_id: "sr:team:3412", reference: "1610612745", games_behind: NBASeason_conferences_divisions_teams_gamesbehind(league: 7, conference: 4, division: 0), streak: NBASeason_conferences_divisions_teams_streak(kind: "loss", length: 1), calc_rank: NBASeason_conferences_divisions_teams_calcrank(div_rank: 1, conf_rank: 4), records: [NBASeason_conferences_divisions_teams_records(record_type: "atlantic", wins: 2, losses: 1, win_pct: 0.667)]))
    }
}
