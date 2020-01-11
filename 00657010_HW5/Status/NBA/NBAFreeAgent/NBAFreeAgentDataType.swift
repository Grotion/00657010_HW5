//
//  NBAFreeAgentDataType.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation

struct NBAFreeAgent_league: Codable
{
    var id: String
    var name: String
    var alias: String
}
struct NBAFreeAgent_freeagent: Codable
{
    var id: String
    var status: String
    var full_name: String
    var first_name: String
    var last_name: String
    var abbr_name: String
    var height: Int
    var weight: Int
    var position: String
    var primary_position: String
    var experience: String?
    var college: String?
    var high_school: String?
    var birth_place: String?
    var birthdate: String?
    var updated: String
}
struct NBAFreeAgentData: Codable
{
    var league: NBADailySchedule_league
    var free_agents: [NBAFreeAgent_freeagent]
}
