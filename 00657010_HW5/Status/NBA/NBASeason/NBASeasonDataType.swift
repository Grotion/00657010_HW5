//
//  NBASeasonDataType.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation

struct NBASeason_league: Codable
{
    var id: String
    var name: String
    var alias: String
}

struct NBASeason_season: Codable
{
    var id: String
    var year: Int
    var type: String
}

struct NBASeason_conferences_divisions_teams_gamesbehind: Codable
{
    var league: Double
    var conference: Double
    var division: Double
}

struct NBASeason_conferences_divisions_teams_streak: Codable
{
    var kind: String
    var length: Int
}

struct NBASeason_conferences_divisions_teams_calcrank: Codable
{
    var div_rank: Int
    var conf_rank: Int
}

struct NBASeason_conferences_divisions_teams_records: Codable
{
    var record_type: String
    var wins: Int
    var losses: Int
    var win_pct: Double
}

struct NBASeason_conferences_divisions_teams: Codable
{
    var id: String
    var name: String
    var market: String
    var wins: Int
    var losses: Int
    var win_pct: Double
    var points_for: Double
    var points_against: Double
    var point_diff: Double
    var sr_id: String
    var reference: String
    var games_behind: NBASeason_conferences_divisions_teams_gamesbehind
    var streak: NBASeason_conferences_divisions_teams_streak
    var calc_rank: NBASeason_conferences_divisions_teams_calcrank
    var records: [NBASeason_conferences_divisions_teams_records]
}

struct NBASeason_conferences_divisions: Codable
{
    var id: String
    var name: String
    var alias: String
    var teams: [NBASeason_conferences_divisions_teams]
}

struct NBASeason_conferences: Codable
{
    var id: String
    var name: String
    var alias: String
    var divisions: [NBASeason_conferences_divisions]
}

struct NBASeasonData: Codable
{
    var league: NBASeason_league
    var season: NBASeason_season
    var conferences: [NBASeason_conferences]
}
