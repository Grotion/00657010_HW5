//
//  F1TeamProfileDataType.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation

struct F1TeamProfile_team: Codable
{
    var id: String
    var name: String
    var gender: String
    var nationality: String
    var country_code: String
}

struct F1TeamProfile_info: Codable
{
    var url_official: String
    var country_code_of_residence: String
    var country_of_residence: String
    var debut: String
    var first_points: String
    var first_pole: String
    var first_victory: String
    var car_nickname: String
    var foundation_year: String
    var location: String
    var car_name: String
    var car_construction_year: String
    var car_tyres: String
    var car_chassis: String
    var car_engine_size: String
    var car_fuel_type: String
    var president: String
    var sports_director: String
    var technical_director: String
    var back_wing_color: String
    var middle_back_sides_color: String
    var middle_back_center_color: String
    var middle_sides_color: String
    var front_color: String
    var front_wing_color: String
    var car_engine_name: String
    var f1_license: String
}

struct F1TeamProfileData: Codable
{
    var generated_at: String
    var schema: String
    var team: F1TeamProfile_team
    var info: F1TeamProfile_info
}

