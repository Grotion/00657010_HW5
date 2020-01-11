//
//  NFLDraftRow.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/1.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI

struct NFLDraftRow: View
{
    var pick: NFLDraft_rounds_picks
    var body: some View
    {
        Text("No.\(pick.overall)\t\(pick.prospect.name)(\(pick.team.alias))")
    }
}

struct NFLDraftRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        NFLDraftRow(pick: NFLDraft_rounds_picks(id: "1", number: 1, overall: 1, team: NFLDraft_rounds_picks_team(id: "1", name: "1", market: "1", alias: "1"), prospect: NFLDraft_rounds_picks_prospect(id: "1", source_id: "1", league_id: "1", first_name: "1", last_name: "1", name: "1", position: "1", height: 1, weight: 1, experience: "1", birth_place: "1", top_prospect: true)))
    }
}
