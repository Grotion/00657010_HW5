//
//  NBALeaderDataType.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation

struct NBALeader_seasons: Codable
{
    var id: String
    var year: Int
    var type: String
}

struct NBALeader_categories_ranks_player: Codable
{
    var id: String
    var full_name: String
    var first_name: String
    var last_name: String
    var position: String
    var primary_position: String
    var jersey_number: String
    var sr_id: String
    var reference: String
}

struct NBALeader_categories_ranks_teams: Codable
{
    var id: String
    var name: String
    var market: String
    var sr_id: String
    var reference: String
}

struct NBALeader_categories_ranks_total: Codable
{
    var games_played: Int
    var games_started: Int
    var minutes: Int
    var field_goals_made: Int
    var field_goals_att: Int
    var field_goals_pct: Double
    var two_points_made: Int
    var two_points_att: Int
    var two_points_pct: Double
    var three_points_made: Int
    var three_points_att: Int
    var three_points_pct: Double
    var blocked_att: Int
    var free_throws_made: Int
    var free_throws_att: Int
    var free_throws_pct: Double
    var offensive_rebounds: Int
    var defensive_rebounds: Int
    var rebounds: Int
    var assists: Int
    var turnovers: Int
    var assists_turnover_ratio: Double
    var steals: Int
    var blocks: Int
    var personal_fouls: Int
    var tech_fouls: Int
    var points: Int
    var flagrant_fouls: Int
    var ejections: Int
    var foulouts: Int
    var true_shooting_att: Double
    var true_shooting_pct: Double
    var efficiency: Int
    var points_off_turnovers: Int
    var points_in_paint: Int
    var points_in_paint_made: Int
    var points_in_paint_att: Int
    var points_in_paint_pct: Double
    var effective_fg_pct: Double
    var double_doubles: Int
    var triple_doubles: Int
    var fouls_drawn: Int
    var offensive_fouls: Int
    var fast_break_pts: Int
    var fast_break_att: Int
    var fast_break_made: Int
    var fast_break_pct: Double
    var coach_ejections: Int
    var second_chance_pct: Double
    var second_chance_pts: Int
    var second_chance_att: Int
    var second_chance_made: Int
    var minus: Int
    var plus: Int
    var coach_tech_fouls: Int
}

struct NBALeader_categories_ranks_average: Codable
{
    var minutes: Double
    var points: Double
    var off_rebounds: Double
    var def_rebounds: Double
    var rebounds: Double
    var assists: Double
    var steals: Double
    var blocks: Double
    var turnovers: Double
    var personal_fouls: Double
    var flagrant_fouls: Double
    var blocked_att: Double
    var field_goals_made: Double
    var field_goals_att: Double
    var three_points_made: Double
    var three_points_att: Double
    var free_throws_made: Double
    var free_throws_att: Double
    var two_points_made: Double
    var two_points_att: Double
    var efficiency: Double
    var true_shooting_att: Double
    var points_off_turnovers: Double
    var points_in_paint_made: Double
    var points_in_paint_att: Double
    var points_in_paint: Double
    var fouls_drawn: Double
    var offensive_fouls: Double
    var fast_break_pts: Double
    var fast_break_att: Double
    var fast_break_made: Double
    var second_chance_pts: Double
    var second_chance_att: Double
    var second_chance_made: Double
}


struct NBALeader_categories_ranks: Codable
{
    var rank: Int
    var tied: Bool
    var score: Double
    var player: NBALeader_categories_ranks_player
    var teams: [NBALeader_categories_ranks_teams]
    var total: NBALeader_categories_ranks_total
    var average: NBALeader_categories_ranks_average
}

struct NBALeader_categories: Codable
{
    var name: String
    var type: String
    var ranks: [NBALeader_categories_ranks]
}

struct NBALeaderData: Codable
{
    var season: NBALeader_seasons
    var id: String
    var name: String
    var alias: String
    var type: String
    var categories: [NBALeader_categories]
}
