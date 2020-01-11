//
//  F1TeamProfileRow.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct F1TeamProfileRow: View
{
    var teamProfile: F1TeamProfileData
    var body: some View
    {
        Text("\(teamProfile.team.name)")
    }
}

struct F1TeamProfileRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        F1TeamProfileRow(teamProfile: F1TeamProfileData(generated_at:"2019-12-30T21:44:19+00:00",schema:"https://schemas.sportradar.com/bsa/formula1/v1/json/endpoints/formula1/competitor_profile.json",team: F1TeamProfile_team(id:"sr:competitor:41127",name: "Mercedes",gender:"male",nationality:"Great Britain",country_code:"GBR"),info: F1TeamProfile_info(url_official:"https://www.mercedesamgf1.com/en/mercedes-amg-f1/",country_code_of_residence:"GBR",country_of_residence:"GREAT BRITAIN",debut:"1954-07-04",first_points:"1954-07-04",first_pole:"1954-07-04",first_victory:"1954-07-04",car_nickname:"Mercedes",foundation_year:"1934",location:"Mercedes Grand Prix Operations Centre Brackley Northants NN13 7BD England",car_name:"Mercedes-Benz F1 W10 EQ Power+",car_construction_year:"2019",car_tyres:"Pirelli",car_chassis:"F1 W10 EQ Power+",car_engine_size:"1600",car_fuel_type:"Petronas Primax race fuels",president:"Toto Wolff",sports_director:"Ron Meadows",technical_director:"James Allison",back_wing_color:"0xf1eff5",middle_back_sides_color:"0xf1eff5",middle_back_center_color:"0xf1eff5",middle_sides_color:"0xf1eff5",front_color:"0xf1eff5",front_wing_color:"0xf1eff5",car_engine_name:"Mercedes AMG M10 EQ Power+",f1_license:"80")))
    }
}
