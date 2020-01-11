//
//  F1CompetitorRow.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct F1CompetitorRow: View
{
    var competitor: F1CompetitorData
    @State private var lastName = ""
    @State private var firstName = ""
    @State private var name = ""
    func setName()
    {
        var names = competitor.competitor.name.split(separator: ",")
        self.lastName = String(names[0])
        names = competitor.competitor.name.split(separator: " ")
        self.firstName = String(names[1])
        self.name = firstName + " " + lastName
    }
    var body: some View
    {
        Text("\(self.name)(\(competitor.competitor.country_code))")
        .onAppear()
        {
            self.setName()
        }
    }
}

struct F1CompetitorRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        F1CompetitorRow(competitor: F1CompetitorData(generated_at:"1999-07-20", schema: "https://schemas.sportradar.com/bsa/formula1/v1/json/endpoints/formula1/competitor_profile.json", competitor: F1Competitor_competitor(id: "test", name: "Lewis", gender: "male", nationality: "Taiwan", country_code: "TPE"), teams: [F1Competitor_team(id: "test", name: "Benz", nationality: "Taiwan", country_code: "TPE")], info: F1Competitor_info(url_official: "http", weight: "66", dateofbirth: "1999-07-20", country_of_residence: "Taiwan", height: "180", salary: "2000", placeofbirth: "Taiwan", debut: "1999-07-20", first_victory: "1999-07-29", wcs_won: "100", car_nickname: "Benz")))
    }
}
