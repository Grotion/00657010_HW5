//
//  ListStruct.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation
import SwiftUI

struct ListData
{
    let id: UUID
    let title: String
    let destination: AnyView

    init(title: String, destination: AnyView)
    {
        self.id = UUID()
        self.title = title
        self.destination = destination
    }
}

/*let Lists =
[
    [
        ListData(title: "Competitor", destination: AnyView(F1CompetitorList())),
        ListData(title: "Team Profile", destination: AnyView(F1TeamProfileList()))
    ],
    [
        ListData(title: "Daily Schedule", destination: AnyView(NBADailyScheduleList())),
        ListData(title: "Free Agent", destination: AnyView(NBAFreeAgentList())),
        ListData(title: "Season", destination: AnyView(NBASeasonList())),
        ListData(title: "Leader", destination: AnyView(NBALeaderList()))
    ],
    [
        ListData(title: "Standings", destination: AnyView(NFLStandingsList())),
        ListData(title: "Drafts", destination: AnyView(NFLDraftList())),
        ListData(title: "Team Profile", destination: AnyView(NFLTeamProfileList()))
    ]
]*/
