//
//  NBASeasonRow.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct NBASeasonRow: View
{
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

struct NBASeasonRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        NBASeasonRow(team: NBASeason_conferences_divisions_teams(id: "583ecb3a-fb46-11e1-82cb-f4ce4684ea4c", name: "Rockets", market: "Houston", wins: 10, losses: 10, win_pct: 10.0, points_for: 10.0, points_against: 10.0, point_diff: 10.0, sr_id: "sr:team:3412", reference: "1610612745", games_behind: NBASeason_conferences_divisions_teams_gamesbehind(league: 7, conference: 4, division: 0), streak: NBASeason_conferences_divisions_teams_streak(kind: "loss", length: 1), calc_rank: NBASeason_conferences_divisions_teams_calcrank(div_rank: 1, conf_rank: 4), records: [NBASeason_conferences_divisions_teams_records(record_type: "atlantic", wins: 2, losses: 1, win_pct: 0.667)]))
    }
}
