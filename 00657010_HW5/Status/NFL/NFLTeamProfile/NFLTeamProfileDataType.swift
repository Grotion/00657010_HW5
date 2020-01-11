//
//  NFLTeamProfileDataType.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/1.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import Foundation

struct NFLTeamProfile_franchise_references: Codable
{
    var id: String
    var origin: String
}

struct NFLTeamProfile_franchise: Codable
{
    var id: String
    var name: String
    var alias: String
    var references: [NFLTeamProfile_franchise_references]
}

struct NFLTeamProfile_venue: Codable
{
    var id: String
    var name: String
    var city: String
    var state: String
    var country: String
    var zip: String
    var address: String
    var capacity: Double
    var surface: String
    var roof_type: String
    var sr_id: String
}

struct NFLTeamProfile_division: Codable
{
    var id: String
    var name: String
    var alias: String
}

struct NFLTeamProfile_conference: Codable
{
    var id: String
    var name: String
    var alias: String
}

struct NFLTeamProfile_references: Codable
{
    var id: String
    var origin: String
}

struct NFLTeamProfile_coaches: Codable
{
    var id: String
    var full_name: String
    var first_name: String
    var last_name: String
    var position: String
}

struct NFLTeamProfile_players_draft_team: Codable
{
    var id: String
    var name: String
    var market: String
    var alias: String
    var sr_id: String
}

struct NFLTeamProfile_players_draft: Codable
{
    var year: Int
    var round: Int
    var number: Int
    var team: NFLTeamProfile_players_draft_team
}

struct NFLTeamProfile_players_references: Codable
{
    var id: String
    var origin: String
}

struct NFLTeamProfile_players: Codable
{
    var id: String
    var name: String
    var jersey: String
    var last_name: String
    var first_name: String
    var abbr_name: String
    var preferred_name: String
    var birth_date: String
    var weight: Int
    var height: Int
    var position: String
    var birth_place: String
    var high_school: String
    var college: String
    var college_conf: String
    var rookie_year: Int
    var status: String
    var sr_id: String
    var draft: NFLTeamProfile_players_draft?
    var references: [NFLTeamProfile_players_references]
}

struct NFLTeamProfileData: Codable
{
    var _comment: String
    var id: String
    var sr_id: String
    var name: String
    var market: String
    var alias: String
    var franchise: NFLTeamProfile_franchise
    var venue: NFLTeamProfile_venue
    var division: NFLTeamProfile_division
    var conference: NFLTeamProfile_conference
    var references: [NFLTeamProfile_references]
    var coaches: [NFLTeamProfile_coaches]
    var players: [NFLTeamProfile_players]
}
