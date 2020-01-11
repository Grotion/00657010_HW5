//
//  F1CompetitorDataType.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation

struct F1Competitor_competitor: Codable
{
    var id: String
    var name: String
    var gender: String
    var nationality: String
    var country_code: String
}

struct F1Competitor_team: Codable
{
    var id: String
    var name: String
    var nationality: String
    var country_code: String
}

struct F1Competitor_info: Codable
{
    var url_official: String
    var weight: String
    var dateofbirth: String
    var country_of_residence: String
    var height: String
    var salary: String
    var placeofbirth: String
    var debut: String
    var first_victory: String
    var wcs_won: String
    var car_nickname: String
}

struct F1CompetitorData: Codable
{
    var generated_at: String
    var schema: String
    var competitor: F1Competitor_competitor
    var teams: [F1Competitor_team]
    var info: F1Competitor_info
}
