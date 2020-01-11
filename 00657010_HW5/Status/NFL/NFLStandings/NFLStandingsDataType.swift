//
//  NFLStandingsDataType.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/1.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import Foundation

struct NFLStandings_season: Codable
{
    var id: String
    var year: Int
    var type: String
    var name: String
}

struct NFLStandings_week: Codable
{
    var id: String
    var sequence: Int
    var title: String
}

struct NFLStandings_conferences_divisions_teams_rank: Codable
{
    var conference: Int
    var division: Int
}

struct NFLStandings_conferences_divisions_teams_streak: Codable
{
    var type: String
    var length: Int
    var desc: String
}

struct NFLStandings_conferences_divisions_teams_strengthofschedule: Codable
{
    var sos: Double
    var wins: Int
    var total: Int
}

struct NFLStandings_conferences_divisions_teams_strengthofvictory: Codable
{
    var sovs: Double?
    var wins: Int
    var total: Int
}

struct NFLStandings_conferences_divisions_teams_records_record: Codable
{
    var category: String
    var wins: Int
    var losses: Int
    var ties: Int
    var win_pct: Double
    var points_for: Int?
    var points_against: Int?
    var points_rank: Int?
}

struct NFLStandings_conferences_divisions_teams_records: Codable
{
    var record: NFLStandings_conferences_divisions_teams_records_record
}

struct NFLStandings_conferences_divisions_teams: Codable
{
    var id: String
    var name: String
    var market: String
    var alias: String
    var sr_id: String
    var wins: Int
    var losses: Int
    var ties: Int
    var win_pct: Double
    var points_for: Int
    var points_against: Int
    var points_rank: Int
    var touchdown_diff: Int
    var conf_h2h: Int
    var clinched: String?
    var rank: NFLStandings_conferences_divisions_teams_rank
    var streak: NFLStandings_conferences_divisions_teams_streak
    var strength_of_schedule: NFLStandings_conferences_divisions_teams_strengthofschedule
    var strength_of_victory: NFLStandings_conferences_divisions_teams_strengthofvictory
    var records: [NFLStandings_conferences_divisions_teams_records]
}

struct NFLStandings_conferences_divisions: Codable
{
    var id: String
    var name: String
    var alias: String
    var teams: [NFLStandings_conferences_divisions_teams]
}

struct NFLStandings_conferences: Codable
{
    var id: String
    var name: String
    var alias: String
    var divisions: [NFLStandings_conferences_divisions]
}

struct NFLStandingsData: Codable
{
    var _comment: String
    var season: NFLStandings_season
    var week: NFLStandings_week
    var conferences: [NFLStandings_conferences]
}
