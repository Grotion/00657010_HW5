//
//  NBALeaderDetail.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct NBALeaderDetail: View
{
    @Environment(\.presentationMode) var presentationMode
    @Binding var dataComplete: Bool
    var category: NBALeader_categories
    @State private var categoryName = ""
    @State private var categoryType = ""
    let lowerCase = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    let upperCase = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "X"]
    let insideColor = Color(red: 127/255, green: 255/255, blue: 212/255)
    let outsideColor = Color(red: 123/255, green: 104/255, blue: 238/255)
    func textReplace()
    {
        var newName = self.category.name.replacingOccurrences(of: "_", with: " ")
        var newType = self.category.type
        newName = newName.replacingOccurrences(of: " att", with: " attempts")
        newName = newName.replacingOccurrences(of: "tech ", with: "technical ")
        newName = newName.replacingOccurrences(of: " pct", with: " percentage")
        newName = newName.replacingOccurrences(of: "off ", with: "offensive ")
        newName = newName.replacingOccurrences(of: "def ", with: "defensive")
        for index in 0..<26
        {
            newName = newName.replacingOccurrences(of: " \(lowerCase[index])", with: " \(upperCase[index])")
        }
        for index in 0..<26
        {
            newName = newName.replacingOccurrences(of: " \(lowerCase[index])", with: " \(upperCase[index])")
        }
        for index in 0..<26
        {
            if(newName.prefix(1) == lowerCase[index])
            {
                newName = newName.replacingCharacters(in: ...newName.startIndex, with: upperCase[index])
            }
            if(newType.prefix(1) == lowerCase[index])
            {
                newType = newType.replacingCharacters(in: ...newType.startIndex, with: upperCase[index])
            }
            
        }
        self.categoryName = newName
        self.categoryType = newType
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
                    VStack(alignment: .center, spacing: geometry.size.width * 20 / 414)
                    {
                        Text("\(self.categoryName)(\(self.categoryType))")
                        .font(Font.system(size:geometry.size.width * 20 / 414))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: geometry.size.width)
                        Group
                        {
                            ForEach(self.category.ranks.indices, id: \.self)
                            {
                                (index) in
                                VStack(alignment: .leading)
                                {
                                    HStack
                                    {
                                        StrokeText(text: "Rank ", width: geometry.size.width * 1.5 / 414, color: .black)
                                        .foregroundColor(.red)
                                        .font(.system(size: geometry.size.width * 30 / 414, weight: .bold))
                                        StrokeText(text: "\(self.category.ranks[index].rank)", width: geometry.size.width * 1.5 / 414, color: .black)
                                        .foregroundColor(.yellow)
                                        .font(.system(size: geometry.size.width * 30 / 414, weight: .bold))
                                        Spacer()
                                    }
                                    .padding(.top, 6)
                                    HStack
                                    {
                                        Image("defaultProfilePic")
                                        .resizable()
                                        .renderingMode(.original)
                                        .scaledToFit()
                                        .frame(width: geometry.size.width * 80 / 414, height:geometry.size.width * 80 / 414)
                                        .clipShape(Circle())
                                        VStack(alignment: .leading)
                                        {
                                            Group
                                            {
                                                HStack
                                                {
                                                    StrokeText(text: "Name: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                    .foregroundColor(self.insideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    StrokeText(text: "\(self.category.ranks[index].player.full_name)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                    .foregroundColor(self.outsideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                }
                                                HStack
                                                {
                                                    StrokeText(text: "Team: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                    .foregroundColor(self.insideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    StrokeText(text: "\(self.category.ranks[index].teams[0].market) \(self.category.ranks[index].teams[0].name)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                    .foregroundColor(self.outsideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                }
                                                HStack
                                                {
                                                    StrokeText(text: "Number,Position: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                    .foregroundColor(self.insideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    StrokeText(text: "\(self.category.ranks[index].player.jersey_number),\(self.category.ranks[index].player.position)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                    .foregroundColor(self.outsideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                }
                                            }
                                        }
                                        Spacer()
                                    }
                                    Group
                                    {
                                        HStack
                                        {
                                            StrokeText(text: "\(self.categoryType) \(self.categoryName): ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                            .foregroundColor(self.insideColor)
                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                            StrokeDouble(double: self.category.ranks[index].score, width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                            .foregroundColor(self.outsideColor)
                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                        }
                                        HStack
                                        {
                                            StrokeText(text: "Total Game Played: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                            .foregroundColor(self.insideColor)
                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                            StrokeText(text: "\(self.category.ranks[index].total.games_played)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                            .foregroundColor(self.outsideColor)
                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                        }
                                        HStack
                                        {
                                            StrokeText(text: "Total Minutes Played: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                            .foregroundColor(self.insideColor)
                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                            StrokeText(text: "\(self.category.ranks[index].total.minutes)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                            .foregroundColor(self.outsideColor)
                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                        }
                                        .padding(.bottom, geometry.size.width * 5 / 414)
                                    }
                                    .foregroundColor(.blue)
                                }
                                .padding(EdgeInsets(top: 0, leading: geometry.size.width * 6 / 414, bottom: 0, trailing: geometry.size.width * 6 / 414))
                                .frame(width: geometry.size.width * 8 / 9)
                                .multilineTextAlignment(.center)
                                .background(Image("\(self.category.ranks[index].teams[0].market) \(self.category.ranks[index].teams[0].name)").resizable().opacity(0.3).scaledToFit())
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414)))
                            }
                        }
                        Spacer()
                        .frame(height: geometry.size.width / 8)
                        .padding(.top, -geometry.size.width * 20 / 414)
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
            self.textReplace()
        }
    }
}

struct NBALeaderDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        NBALeaderDetail(dataComplete: .constant(true), category: NBALeader_categories(name: "minutes", type: "total", ranks: [NBALeader_categories_ranks(rank: 1, tied: false, score: 1247, player: NBALeader_categories_ranks_player(id: "1", full_name: "1", first_name: "1", last_name: "1", position: "1", primary_position: "1", jersey_number: "1", sr_id: "1", reference: "1"), teams: [NBALeader_categories_ranks_teams(id: "1", name: "1", market: "1", sr_id: "1", reference: "1")], total: NBALeader_categories_ranks_total(games_played: 1, games_started: 1, minutes: 1, field_goals_made: 1, field_goals_att: 1, field_goals_pct: 1.0, two_points_made: 1, two_points_att: 1, two_points_pct: 1.0, three_points_made: 1, three_points_att: 1, three_points_pct: 1.0, blocked_att: 1, free_throws_made: 1, free_throws_att: 1, free_throws_pct: 1.0, offensive_rebounds: 1, defensive_rebounds: 1, rebounds: 1, assists: 1, turnovers: 1, assists_turnover_ratio: 1.0, steals: 1, blocks: 1, personal_fouls: 1, tech_fouls: 1, points: 1, flagrant_fouls: 1, ejections: 1, foulouts: 1, true_shooting_att: 1.01, true_shooting_pct: 1.0, efficiency: 1, points_off_turnovers: 1, points_in_paint: 1, points_in_paint_made: 1, points_in_paint_att: 1, points_in_paint_pct: 1.0, effective_fg_pct: 1.02, double_doubles: 1, triple_doubles: 1, fouls_drawn: 1, offensive_fouls: 1, fast_break_pts: 1, fast_break_att: 1, fast_break_made: 1, fast_break_pct: 1.91, coach_ejections: 1, second_chance_pct: 1.99, second_chance_pts: 1, second_chance_att: 1, second_chance_made: 1, minus: 1, plus: 1, coach_tech_fouls: 1), average: NBALeader_categories_ranks_average(minutes: 1.0, points: 1.0, off_rebounds: 1, def_rebounds: 1, rebounds: 1, assists: 1, steals: 1, blocks: 1, turnovers: 1, personal_fouls: 1, flagrant_fouls: 1, blocked_att: 1, field_goals_made: 1, field_goals_att: 1, three_points_made: 1, three_points_att: 1, free_throws_made: 1, free_throws_att: 1, two_points_made: 1, two_points_att: 1, efficiency: 1, true_shooting_att: 1, points_off_turnovers: 1, points_in_paint_made: 1, points_in_paint_att: 1, points_in_paint: 1, fouls_drawn: 1, offensive_fouls: 1, fast_break_pts: 1, fast_break_att: 1, fast_break_made: 1, second_chance_pts: 1, second_chance_att: 1, second_chance_made: 1))]))
    }
}
