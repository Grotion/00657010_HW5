//
//  NFLDraftDetail.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/1.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI

struct NFLDraftDetail: View
{
    @Environment(\.presentationMode) var presentationMode
    @Binding var dataComplete: Bool
    var pick: NFLDraft_rounds_picks
    @State private var teamName = "New England Patriots"
    @State private var round: Int = 1
    @State private var foots: Int = 7
    @State private var inches: Int = 3
    func setTeamName()
    {
        self.teamName = self.pick.team.market + " " + self.pick.team.name
        self.round = (self.pick.overall / 32) + 1
        if(self.pick.prospect.height > 100)
        {
            self.foots = self.pick.prospect.height / 100
            self.inches = self.pick.prospect.height % 100
        }
        else
        {
            self.foots = self.pick.prospect.height / 10
            self.inches = self.pick.prospect.height % 10
        }
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
                        Image("defaultProfilePic")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .frame(width: geometry.size.width / 2, height:geometry.size.width / 2)
                        .clipShape(Circle())
                        VStack(alignment: .leading, spacing: geometry.size.width * 10 / 414)
                        {
                            Group
                            {
                                HStack
                                {
                                    Text("Name: ")
                                    Text("\(self.pick.prospect.name)")
                                }
                                HStack
                                {
                                    Text("Team: ")
                                    Text("\(self.teamName)")
                                    Image("\(self.teamName)")
                                    .resizable()
                                    .renderingMode(.original)
                                    .scaledToFit()
                                    .frame(width:geometry.size.width * 50 / 414, height:geometry.size.width * 50 / 414)
                                }
                                HStack
                                {
                                    Text("Round: ")
                                    Text("\(self.round)")
                                }
                                HStack
                                {
                                    Text("Round Pick: ")
                                    Text("\(self.pick.number)")
                                }
                                HStack
                                {
                                    Text("Total Pick: ")
                                    Text("\(self.pick.overall)")
                                }
                                HStack
                                {
                                    Text("Position: ")
                                    Text("\(self.pick.prospect.position)")
                                }
                                HStack
                                {
                                    Text("Height: ")
                                    Text("\(self.foots)'\(self.inches)\"")
                                }
                                HStack
                                {
                                    Text("Weight: ")
                                    Text("\(self.pick.prospect.weight)")
                                    Text(" lbs")
                                }
                                HStack
                                {
                                    Text("Birth Place: ")
                                    Text("\(self.pick.prospect.birth_place)")
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

struct NFLDraftDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        NFLDraftDetail(dataComplete: .constant(true), pick: NFLDraft_rounds_picks(id: "1", number: 1, overall: 1, team: NFLDraft_rounds_picks_team(id: "1", name: "1", market: "1", alias: "1"), prospect: NFLDraft_rounds_picks_prospect(id: "1", source_id: "1", league_id: "1", first_name: "1", last_name: "1", name: "1", position: "1", height: 1, weight: 1, experience: "1", birth_place: "1", top_prospect: true)))
    }
}
