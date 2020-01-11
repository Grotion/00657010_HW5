//
//  NBALeaderRow.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct NBALeaderRow: View
{
    var category: NBALeader_categories
    @State private var categoryName = ""
    @State private var categoryType = ""
    let lowerCase = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    let upperCase = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "X"]
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
        Text("\(self.categoryName)(\(self.categoryType))")
        .onAppear()
        {
            self.textReplace()
        }
    }
}

struct NBALeaderRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        NBALeaderRow(category: NBALeader_categories(name: "minutes", type: "total", ranks: [NBALeader_categories_ranks(rank: 1, tied: false, score: 1247, player: NBALeader_categories_ranks_player(id: "1", full_name: "1", first_name: "1", last_name: "1", position: "1", primary_position: "1", jersey_number: "1", sr_id: "1", reference: "1"), teams: [NBALeader_categories_ranks_teams(id: "1", name: "1", market: "1", sr_id: "1", reference: "1")], total: NBALeader_categories_ranks_total(games_played: 1, games_started: 1, minutes: 1, field_goals_made: 1, field_goals_att: 1, field_goals_pct: 1.0, two_points_made: 1, two_points_att: 1, two_points_pct: 1.0, three_points_made: 1, three_points_att: 1, three_points_pct: 1.0, blocked_att: 1, free_throws_made: 1, free_throws_att: 1, free_throws_pct: 1.0, offensive_rebounds: 1, defensive_rebounds: 1, rebounds: 1, assists: 1, turnovers: 1, assists_turnover_ratio: 1.0, steals: 1, blocks: 1, personal_fouls: 1, tech_fouls: 1, points: 1, flagrant_fouls: 1, ejections: 1, foulouts: 1, true_shooting_att: 1.01, true_shooting_pct: 1.0, efficiency: 1, points_off_turnovers: 1, points_in_paint: 1, points_in_paint_made: 1, points_in_paint_att: 1, points_in_paint_pct: 1.0, effective_fg_pct: 1.02, double_doubles: 1, triple_doubles: 1, fouls_drawn: 1, offensive_fouls: 1, fast_break_pts: 1, fast_break_att: 1, fast_break_made: 1, fast_break_pct: 1.91, coach_ejections: 1, second_chance_pct: 1.99, second_chance_pts: 1, second_chance_att: 1, second_chance_made: 1, minus: 1, plus: 1, coach_tech_fouls: 1), average: NBALeader_categories_ranks_average(minutes: 1.0, points: 1.0, off_rebounds: 1, def_rebounds: 1, rebounds: 1, assists: 1, steals: 1, blocks: 1, turnovers: 1, personal_fouls: 1, flagrant_fouls: 1, blocked_att: 1, field_goals_made: 1, field_goals_att: 1, three_points_made: 1, three_points_att: 1, free_throws_made: 1, free_throws_att: 1, two_points_made: 1, two_points_att: 1, efficiency: 1, true_shooting_att: 1, points_off_turnovers: 1, points_in_paint_made: 1, points_in_paint_att: 1, points_in_paint: 1, fouls_drawn: 1, offensive_fouls: 1, fast_break_pts: 1, fast_break_att: 1, fast_break_made: 1, second_chance_pts: 1, second_chance_att: 1, second_chance_made: 1))]))
    }
}
