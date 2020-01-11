//
//  F1TeamProfileDetail.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct F1TeamProfileDetail: View
{
    @Environment(\.presentationMode) var presentationMode
    @Binding var dataComplete: Bool
    var teamProfile: F1TeamProfileData
    @State private var showOfficial = false
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
                        Image("defaultF1TeamProfile")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .frame(width: geometry.size.width * 3 / 4, height:geometry.size.width * 9 / 16)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        Text("\(self.teamProfile.team.name)")
                        .font(Font.system(size:geometry.size.width * 30 / 414))
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .frame(maxWidth: geometry.size.width)
                        .padding(.bottom, geometry.size.width * 20 / 414)
                        VStack(alignment: .leading, spacing: geometry.size.width * 10 / 414)
                        {
                            HStack
                            {
                                Text("Official: ")
                                Button(action:{self.showOfficial = true})
                                {
                                    Text(self.teamProfile.info.url_official)
                                    .foregroundColor(.blue)
                                }
                                .sheet(isPresented: self.$showOfficial)
                                {
                                    SafariViewController(url: URL(string: self.teamProfile.info.url_official)!)
                                }
                            }
                            Group
                            {
                                HStack
                                {
                                    Text("Team Nationality: ")
                                    Text("\(self.teamProfile.team.nationality)")
                                }
                                HStack
                                {
                                    Text("Location: ")
                                    Text("\(self.teamProfile.info.location)")
                                }
                                HStack
                                {
                                    Text("Car Name: ")
                                    Text("\(self.teamProfile.info.car_name)")
                                }
                                HStack
                                {
                                    Text("Foundation Year: ")
                                    Text("\(self.teamProfile.info.foundation_year)")
                                }
                                HStack
                                {
                                    Text("President: ")
                                    Text("\(self.teamProfile.info.president)")
                                }
                                HStack
                                {
                                    Text("Sport Director: ")
                                    Text("\(self.teamProfile.info.sports_director)")
                                }
                                HStack
                                {
                                    Text("Technical Director: ")
                                    Text("\(self.teamProfile.info.technical_director)")
                                }
                            }
                        }
                        .frame(maxWidth: geometry.size.width)
                        Spacer()
                        .frame(height: geometry.size.width / 8)
                    }
                    .lineLimit(Int.max)
                }
            }
            .navigationBarItems(leading: Button(action:
            {
                self.dataComplete = false
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)})
        }
    }
}

struct F1TeamProfileDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        F1TeamProfileDetail(dataComplete: .constant(true), teamProfile: F1TeamProfileData(generated_at:"2019-12-30T21:44:19+00:00",schema:"https://schemas.sportradar.com/bsa/formula1/v1/json/endpoints/formula1/competitor_profile.json",team: F1TeamProfile_team(id:"sr:competitor:41127",name: "Mercedes",gender:"male",nationality:"Great Britain",country_code:"GBR"),info: F1TeamProfile_info(url_official:"https://www.mercedesamgf1.com/en/mercedes-amg-f1/",country_code_of_residence:"GBR",country_of_residence:"GREAT BRITAIN",debut:"1954-07-04",first_points:"1954-07-04",first_pole:"1954-07-04",first_victory:"1954-07-04",car_nickname:"Mercedes",foundation_year:"1934",location:"Mercedes Grand Prix Operations Centre Brackley Northants NN13 7BD England",car_name:"Mercedes-Benz F1 W10 EQ Power+",car_construction_year:"2019",car_tyres:"Pirelli",car_chassis:"F1 W10 EQ Power+",car_engine_size:"1600",car_fuel_type:"Petronas Primax race fuels",president:"Toto Wolff",sports_director:"Ron Meadows",technical_director:"James Allison",back_wing_color:"0xf1eff5",middle_back_sides_color:"0xf1eff5",middle_back_center_color:"0xf1eff5",middle_sides_color:"0xf1eff5",front_color:"0xf1eff5",front_wing_color:"0xf1eff5",car_engine_name:"Mercedes AMG M10 EQ Power+",f1_license:"80")))
    }
}
