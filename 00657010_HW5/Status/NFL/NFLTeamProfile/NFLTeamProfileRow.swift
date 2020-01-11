//
//  NFLTeamProfileRow.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/1.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI

struct NFLTeamProfileRow: View
{
    var teamProfile: NFLTeamProfileData
    @State private var teamName = "Los Angeles Lakers"
    func setTeamName()
    {
        self.teamName = self.teamProfile.market + " " + self.teamProfile.name
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

struct NFLTeamProfileRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        NFLTeamProfileRow(teamProfile: NFLTeamProfileData(_comment: "1", id: "1", sr_id: "1", name: "1", market: "1", alias: "1", franchise: NFLTeamProfile_franchise(id: "1", name: "1", alias: "1", references: [NFLTeamProfile_franchise_references(id: "1", origin: "1")]), venue: NFLTeamProfile_venue(id: "1", name: "1", city: "1", state: "1", country: "1", zip: "1", address: "1", capacity: 1.00, surface: "1", roof_type: "1", sr_id: "1"), division: NFLTeamProfile_division(id: "1", name: "1", alias: "1"), conference: NFLTeamProfile_conference(id: "1", name: "1", alias: "1"), references: [NFLTeamProfile_references(id: "1", origin: "1")], coaches: [NFLTeamProfile_coaches(id: "1", full_name: "1", first_name: "1", last_name: "1", position: "1")], players: [NFLTeamProfile_players(id: "1", name: "1", jersey: "1", last_name: "1", first_name: "1", abbr_name: "1", preferred_name: "1", birth_date: "1", weight: 1, height: 1, position: "1", birth_place: "1", high_school: "1", college: "1", college_conf: "1", rookie_year: 1, status: "1", sr_id: "1", draft: NFLTeamProfile_players_draft(year: 2020, round: 1, number: 1, team: NFLTeamProfile_players_draft_team(id: "1", name: "1", market: "1", alias: "1", sr_id: "1")), references: [NFLTeamProfile_players_references(id: "1", origin: "1")])]))
    }
}
