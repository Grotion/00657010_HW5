//
//  NFLStandingsDetail.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/1.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI

struct NFLStandingsDetail: View
{
    @Environment(\.presentationMode) var presentationMode
    @Binding var dataComplete: Bool
    var team: NFLStandings_conferences_divisions_teams
    @State private var teamName = "New England Patriots"
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
                        Text("\(self.teamName)(\(self.team.alias))")
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
                                    Text("Win Percentage: ")
                                    Text("\(self.team.win_pct, specifier: "%.2f")")
                                }
                                HStack
                                {
                                    Text("Points For: ")
                                    Text("\(self.team.points_for)")
                                }
                                HStack
                                {
                                    Text("Point Against: ")
                                    Text("\(self.team.points_against)")
                                }
                                HStack
                                {
                                    Text("Touchdown Difference: ")
                                    Text("\(self.team.touchdown_diff)")
                                }
                                HStack
                                {
                                    Text("Division Rank: ")
                                    Text("\(self.team.rank.division)")
                                }
                                HStack
                                {
                                    Text("Conferrence Rank: ")
                                    Text("\(self.team.rank.conference)")
                                }
                                HStack
                                {
                                    Text("Point Rank: ")
                                    Text("\(self.team.points_rank)")
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

struct NFLStandingsDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        NFLStandingsDetail(dataComplete: .constant(true), team: NFLStandings_conferences_divisions_teams(id: "1", name: "1", market: "1", alias: "1", sr_id: "1", wins: 1, losses: 1, ties: 1, win_pct: 1.01, points_for: 1, points_against: 1, points_rank: 1, touchdown_diff: 1, conf_h2h: 1, clinched: "1", rank: NFLStandings_conferences_divisions_teams_rank(conference: 1, division: 1), streak: NFLStandings_conferences_divisions_teams_streak(type: "1", length: 1, desc: "1"), strength_of_schedule: NFLStandings_conferences_divisions_teams_strengthofschedule(sos: 1.0, wins: 1, total: 1), strength_of_victory: NFLStandings_conferences_divisions_teams_strengthofvictory(sovs: 1.9, wins: 1, total: 1), records: [NFLStandings_conferences_divisions_teams_records(record: NFLStandings_conferences_divisions_teams_records_record(category: "1", wins: 1, losses: 1, ties: 1, win_pct: 1.9, points_for: 1, points_against: 1, points_rank: 1))]))
    }
}
