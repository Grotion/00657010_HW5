//
//  NBADailyScheduleDataType.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation

struct NBADailySchedule_league: Codable
{
    var id: String
    var name: String
    var alias: String
}

struct NBADailySchedule_game_timezone: Codable
{
    var venue: String
    var home: String
    var away: String
}
struct NBADailySchedule_game_venue: Codable
{
    var id: String
    var name: String
    var capacity: Int
    var address: String
    var city: String
    var state: String
    var zip: String
    var country: String
    var sr_id: String
}
struct NBADailySchedule_game_broadcasts: Codable
{
    var network: String
    var type: String
    var locale: String
    var channel: String?
}
struct NBADailySchedule_game_home_away: Codable
{
    var name: String
    var alias: String
    var id: String
    var sr_id: String
    var reference: String
}
struct NBADailySchedule_game: Codable
{
    var id: String
    var status: String
    var coverage: String
    var scheduled: String
    var home_points: Int
    var away_points: Int
    var track_on_court: Bool
    var sr_id: String
    var reference: String
    var time_zones: NBADailySchedule_game_timezone
    var venue: NBADailySchedule_game_venue
    var broadcasts: [NBADailySchedule_game_broadcasts]
    var home: NBADailySchedule_game_home_away
    var away: NBADailySchedule_game_home_away
}
 
struct NBADailyScheduleData: Codable
{
    var league: NBADailySchedule_league
    var date: String
    var games: [NBADailySchedule_game]
}
 

