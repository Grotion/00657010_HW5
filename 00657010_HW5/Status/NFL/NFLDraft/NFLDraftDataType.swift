//
//  NFLDraftDataType.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/1.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import Foundation

struct NFLDraft_draft_league: Codable
{
    var id: String
    var name: String
    var alias: String
}

struct NFLDraft_draft_broadcast: Codable
{
    var channel: String
    var network: String
    var internet: String
}

struct NFLDraft_draft_venue: Codable
{
    var name: String
    var city: String
    var state: String
    var country: String
}

struct NFLDraft_draft: Codable
{
    var id: String
    var year: Int
    var start_date: String
    var end_date: String
    var status: String
    var league: NFLDraft_draft_league
    var broadcast: NFLDraft_draft_broadcast
    var venue: NFLDraft_draft_venue
}

struct NFLDraft_rounds_picks_team: Codable
{
    var id: String
    var name: String
    var market: String
    var alias: String
}

struct NFLDraft_rounds_picks_prospect: Codable
{
    var id: String
    var source_id: String?
    var league_id: String
    var first_name: String
    var last_name: String
    var name: String
    var position: String
    var height: Int
    var weight: Int
    var experience: String
    var birth_place: String
    var top_prospect: Bool?
}

struct NFLDraft_rounds_picks: Codable
{
    var id: String
    var number: Int
    var overall: Int
    var team: NFLDraft_rounds_picks_team
    var prospect: NFLDraft_rounds_picks_prospect
}

struct NFLDraft_rounds: Codable
{
    var id: String
    var number: Int
    var start_date: String
    var end_date: String
    var status: String
    var picks: [NFLDraft_rounds_picks]
}

struct NFLDraftData: Codable
{
    var _comment: String
    var draft: NFLDraft_draft
    var rounds: [NFLDraft_rounds]
}
