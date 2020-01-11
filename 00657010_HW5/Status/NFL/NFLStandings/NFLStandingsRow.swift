//
//  NFLStandingsRow.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/1.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI

struct NFLStandingsRow: View
{
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
            HStack
            {
                Image("\(self.teamName)")
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: geometry.size.width * 50 / 414, height:geometry.size.width * 50 / 414)
                Text("\(self.teamName)")
                Spacer()
            }
        }
        .onAppear()
        {
            self.setTeamName()
        }
    }
}

struct NFLStandingsRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        NFLStandingsRow(team: NFLStandings_conferences_divisions_teams(id: "1", name: "1", market: "1", alias: "1", sr_id: "1", wins: 1, losses: 1, ties: 1, win_pct: 1.01, points_for: 1, points_against: 1, points_rank: 1, touchdown_diff: 1, conf_h2h: 1, clinched: "1", rank: NFLStandings_conferences_divisions_teams_rank(conference: 1, division: 1), streak: NFLStandings_conferences_divisions_teams_streak(type: "1", length: 1, desc: "1"), strength_of_schedule: NFLStandings_conferences_divisions_teams_strengthofschedule(sos: 1.0, wins: 1, total: 1), strength_of_victory: NFLStandings_conferences_divisions_teams_strengthofvictory(sovs: 1.9, wins: 1, total: 1), records: [NFLStandings_conferences_divisions_teams_records(record: NFLStandings_conferences_divisions_teams_records_record(category: "1", wins: 1, losses: 1, ties: 1, win_pct: 1.9, points_for: 1, points_against: 1, points_rank: 1))]))
    }
}
