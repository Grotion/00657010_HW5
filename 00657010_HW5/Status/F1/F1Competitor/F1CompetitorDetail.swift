//
//  F1CompetitorDetail.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct F1CompetitorDetail: View
{
    @Environment(\.presentationMode) var presentationMode
    @Binding var dataComplete: Bool
    var competitor: F1CompetitorData
    @State private var showOfficial = false
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
        GeometryReader
        {
            geometry in
            ZStack
            {
                Image("detailBackground")
                .resizable()
                .opacity(0.3)
                .frame(width: geometry.size.width)
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                ScrollView
                {
                    VStack(alignment: .center)
                    {
                        Image("defaultProfilePic")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .frame(width: geometry.size.width / 2, height:geometry.size.width / 2)
                        .clipShape(Circle())
                        VStack(alignment: .leading, spacing: geometry.size.width * 10 / 414)
                        {
                            Group
                            {
                                HStack
                                {
                                    Text("Name: ")
                                    Text("\(self.name)")
                                }
                                HStack
                                {
                                    Text("Nationality: ")
                                    Text("\(self.competitor.competitor.nationality)")
                                }
                                HStack
                                {
                                    Text("Gender: ")
                                    Text("\(self.competitor.competitor.gender)")
                                }
                                HStack
                                {
                                    Text("Height: ")
                                    Text("\(self.competitor.info.height)")
                                    Text(" cm")
                                }
                            }
                            .lineLimit(Int.max)
                            HStack
                            {
                                Text("Official: ")
                                Button(action:{self.showOfficial = true})
                                {
                                    Text(self.competitor.info.url_official)
                                    .foregroundColor(.blue)
                                }
                                .sheet(isPresented: self.$showOfficial)
                                {
                                    SafariViewController(url: URL(string: self.competitor.info.url_official)!)
                                }
                            }
                            Group
                            {
                                HStack
                                {
                                    Text("Wcs Won: ")
                                    Text("\(self.competitor.info.wcs_won)")
                                }
                                HStack
                                {
                                    Text("Team: ")
                                    Text("\(self.competitor.teams[0].name)")
                                }
                                HStack
                                {
                                    Text("Birthday: ")
                                    Text("\(self.competitor.info.dateofbirth)")
                                }
                                HStack
                                {
                                    Text("Salary: ")
                                    Text("\(self.competitor.info.salary)")
                                }
                                HStack
                                {
                                    Text("First Victory: ")
                                    Text("\(self.competitor.info.first_victory)")
                                }
                            }
                        }
                        .frame(maxWidth: geometry.size.width)
                        Spacer()
                        .frame(height: geometry.size.width / 8)
                    }
                }
            }
            .lineLimit(Int.max)
            .navigationBarItems(leading: Button(action:
            {
                self.dataComplete = false
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)})
        }
        .onAppear()
        {
            self.setName()
        }
    }
}

struct F1CompetitorDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        F1CompetitorDetail(dataComplete: .constant(true), competitor: F1CompetitorData(generated_at:"1999-07-20", schema: "https://schemas.sportradar.com/bsa/formula1/v1/json/endpoints/formula1/competitor_profile.json", competitor: F1Competitor_competitor(id: "test", name: "Lewis", gender: "male", nationality: "Taiwan", country_code: "TPE"), teams: [F1Competitor_team(id: "test", name: "Benz", nationality: "Taiwan", country_code: "TPE")], info: F1Competitor_info(url_official: "http", weight: "66", dateofbirth: "1999-07-20", country_of_residence: "Taiwan", height: "180", salary: "2000", placeofbirth: "Taiwan", debut: "1999-07-20", first_victory: "1999-07-29", wcs_won: "100", car_nickname: "Benz")))
    }
}
