//
//  NFLTeamProfileDetail.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/1.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI

struct NFLTeamProfileDetail: View
{
    @Environment(\.presentationMode) var presentationMode
    @Binding var dataComplete: Bool
    var teamProfile: NFLTeamProfileData
    @State private var teamName = "Los Angeles Lakers"
    @State private var conferrence = ""
    @State private var division = ""
    @State private var originalHeight = [Int]()
    /*@State private var draftYear = [Int]()
    @State private var draftRound = [Int]()
    @State private var draftNumber = [Int]()
    @State private var draftTeam = [String]()*/
    let insideColor = Color(red: 127/255, green: 255/255, blue: 212/255)
    let outsideColor = Color(red: 123/255, green: 104/255, blue: 238/255)
    func setTeamName()
    {
        self.teamName = self.teamProfile.market + " " + self.teamProfile.name
        let shortConferrence = self.teamProfile.conference.alias
        if(shortConferrence == "AFC")
        {
            self.conferrence = "American Football Conferrence"
        }
        else if(shortConferrence == "NFC")
        {
            self.conferrence = "National Football Conferrence"
        }
        let longDivision = self.teamProfile.division.alias
        if(longDivision == "AFC_EAST" || longDivision == "NFC_EAST")
        {
            self.division = "East"
        }
        else if(longDivision == "AFC_NORTH" || longDivision == "NFC_NORTH")
        {
            self.division = "North"
        }
        else if(longDivision == "AFC_SOUTH" || longDivision == "NFC_SOUTH")
        {
            self.division = "South"
        }
        else if(longDivision == "AFC_WEST" || longDivision == "NFC_WEST")
        {
            self.division = "West"
        }
        self.originalHeight.removeAll()
        /*self.draftYear.removeAll()
        self.draftRound.removeAll()
        self.draftNumber.removeAll()
        self.draftTeam.removeAll()*/
        for index in self.teamProfile.players.indices
        {
            self.originalHeight.append(self.teamProfile.players[index].height)
            /*if(self.teamProfile.players[index].draft != nil)
            {
                self.draftYear.append(self.teamProfile.players[index].draft!.year)
                self.draftRound.append(self.teamProfile.players[index].draft!.round)
                self.draftNumber.append(self.teamProfile.players[index].draft!.number)
                self.draftTeam.append(self.teamProfile.players[index].draft!.team.market + " " + self.teamProfile.players[index].draft!.team.name)
            }
            else
            {
                self.draftYear.append(-1)
                self.draftRound.append(-1)
                self.draftNumber.append(-1)
                self.draftTeam.append("Unknow")
            }*/
        }
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
                    VStack(alignment: .center, spacing: geometry.size.width * 20 / 414)
                    {
                        Image("\(self.teamName)")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .frame(width: geometry.size.width / 2, height:geometry.size.width / 2)
                        Group
                        {
                            VStack(alignment: .leading)
                            {
                                HStack
                                {
                                    StrokeText(text: "\(self.teamName)", width: geometry.size.width * 1.5 / 414, color: .black)
                                    .foregroundColor(.red)
                                    .font(.system(size: geometry.size.width * 30 / 414, weight: .bold))
                                    Spacer()
                                }
                                .padding(.top, geometry.size.width * geometry.size.width * 6 / 414 / 414)
                                HStack
                                {
                                    StrokeText(text: "Conferrence: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                    .foregroundColor(self.insideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                    StrokeText(text: "\(self.conferrence)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                    .foregroundColor(self.outsideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                }
                                HStack
                                {
                                    StrokeText(text: "Division: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                    .foregroundColor(self.insideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                    StrokeText(text: "\(self.division)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                    .foregroundColor(self.outsideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                }
                                .padding(.bottom, geometry.size.width * 6 / 414)
                            }
                            VStack(alignment: .leading)
                            {
                                HStack
                                {
                                    StrokeText(text: "Venue", width: geometry.size.width * 1.5 / 414, color: .black)
                                    .foregroundColor(.red)
                                    .font(.system(size: geometry.size.width * 30 / 414, weight: .bold))
                                    Spacer()
                                }
                                .padding(.top, geometry.size.width * 6 / 414)
                                HStack
                                {
                                    StrokeText(text: "Name: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                    .foregroundColor(self.insideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                    StrokeText(text: "\(self.teamProfile.venue.name)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                    .foregroundColor(self.outsideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                }
                                HStack
                                {
                                    StrokeText(text: "Location: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                    .foregroundColor(self.insideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                    StrokeText(text: "\(self.teamProfile.venue.country), \(self.teamProfile.venue.state), \(self.teamProfile.venue.city)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                    .foregroundColor(self.outsideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                }
                                HStack
                                {
                                    StrokeText(text: "Capacity: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                    .foregroundColor(self.insideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                    StrokeText(text: "\(self.teamProfile.venue.capacity)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                    .foregroundColor(self.outsideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                }
                                HStack
                                {
                                    StrokeText(text: "Surface: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                    .foregroundColor(self.insideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                    StrokeText(text: "\(self.teamProfile.venue.surface)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                    .foregroundColor(self.outsideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                }
                                HStack
                                {
                                    StrokeText(text: "Roof Type: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                    .foregroundColor(self.insideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                    StrokeText(text: "\(self.teamProfile.venue.roof_type)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                    .foregroundColor(self.outsideColor)
                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                }
                                .padding(.bottom, geometry.size.width * 6 / 414)
                            }
                            VStack(alignment: .center)
                            {
                                HStack
                                {
                                    StrokeText(text: "Coaches", width: geometry.size.width * 1.5 / 414, color: .black)
                                    .foregroundColor(.red)
                                    .font(.system(size: geometry.size.width * 30 / 414, weight: .bold))
                                    Spacer()
                                }
                                .padding(.top, geometry.size.width * 6 / 414)
                                VStack(alignment: .center, spacing: geometry.size.width * 20 / 414)
                                {
                                    ForEach(self.teamProfile.coaches.indices, id: \.self)
                                    {
                                        (index) in
                                        HStack
                                        {
                                            Image("defaultProfilePic")
                                            .resizable()
                                            .renderingMode(.original)
                                            .scaledToFit()
                                            .frame(width: geometry.size.width * 40 / 414, height:geometry.size.width * 40 / 414)
                                            .clipShape(Circle())
                                            VStack(alignment: .leading)
                                            {
                                                HStack
                                                {
                                                    StrokeText(text: "Name: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                    .foregroundColor(self.insideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    StrokeText(text: "\(self.teamProfile.coaches[index].full_name)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                    .foregroundColor(self.outsideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                }
                                                HStack
                                                {
                                                    StrokeText(text: "Position: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                    .foregroundColor(self.insideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    StrokeText(text: "\(self.teamProfile.coaches[index].position)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                    .foregroundColor(self.outsideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                }
                                            }
                                            Spacer()
                                        }
                                        .padding(EdgeInsets(top: geometry.size.width * 6 / 414, leading: geometry.size.width * 6 / 414, bottom: geometry.size.width * 6 / 414, trailing: geometry.size.width * 6 / 414))
                                        .frame(width: geometry.size.width * 7 / 9)
                                        .multilineTextAlignment(.center)
                                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.orange))
                                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, style: StrokeStyle(lineWidth: 5)))
                                    }
                                }
                                .padding(.bottom, geometry.size.width * 20 / 414)
                            }
                            VStack(alignment: .center)
                            {
                                HStack
                                {
                                    StrokeText(text: "Players", width: geometry.size.width * 1.5 / 414, color: .black)
                                    .foregroundColor(.red)
                                    .font(.system(size: geometry.size.width * 30 / 414, weight: .bold))
                                    Spacer()
                                }
                                .padding(.top, geometry.size.width * 6 / 414)
                                VStack(alignment: .center, spacing: geometry.size.width * 20 / 414)
                                {
                                    
                                    //ForEach(0..<50, id: \.self)
                                    ForEach(self.teamProfile.players.indices, id: \.self)
                                    {
                                        (index) in
                                        VStack(alignment: .leading)
                                        {
                                            Group
                                            {
                                                HStack
                                                {
                                                    Image("defaultProfilePic")
                                                    .resizable()
                                                    .renderingMode(.original)
                                                    .scaledToFit()
                                                    .frame(width: geometry.size.width * 80 / 414, height:geometry.size.width * 80 / 414)
                                                    .clipShape(Circle())
                                                    VStack(alignment: .leading)
                                                    {
                                                        HStack
                                                        {
                                                            StrokeText(text: "Name: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                            .foregroundColor(self.insideColor)
                                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                            StrokeText(text: "\(self.teamProfile.players[index].name)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                            .foregroundColor(self.outsideColor)
                                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        }
                                                        HStack
                                                        {
                                                            StrokeText(text: "Position: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                            .foregroundColor(self.insideColor)
                                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                            StrokeText(text: "\(self.teamProfile.players[index].position)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                            .foregroundColor(self.outsideColor)
                                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        }
                                                    }
                                                    Spacer()
                                                }
                                                HStack
                                                {
                                                    HStack
                                                    {
                                                        StrokeText(text: "Weight: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                        .foregroundColor(self.insideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        StrokeText(text: "\(self.teamProfile.players[index].weight)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                        .foregroundColor(self.outsideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        StrokeText(text: " lbs", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                        .foregroundColor(self.outsideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    }
                                                    HStack
                                                    {
                                                        StrokeText(text: "Height: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                        .foregroundColor(self.insideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        StrokeText(text: "\(self.teamProfile.players[index].height)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                        .foregroundColor(self.outsideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    }
                                                }
                                                HStack
                                                {
                                                    StrokeText(text: "Birthday: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                    .foregroundColor(self.insideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    StrokeText(text: "\(self.teamProfile.players[index].birth_date)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                    .foregroundColor(self.outsideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                }
                                                HStack
                                                {
                                                    StrokeText(text: "Birth Place: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                    .foregroundColor(self.insideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    StrokeText(text: "\(self.teamProfile.players[index].birth_place)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                    .foregroundColor(self.outsideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                }
                                                HStack
                                                {
                                                    StrokeText(text: "High School: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                    .foregroundColor(self.insideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    StrokeText(text: "\(self.teamProfile.players[index].high_school)", width: 1.5, color: self.insideColor)
                                                    .foregroundColor(self.outsideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                }
                                                HStack
                                                {
                                                    StrokeText(text: "College: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                    .foregroundColor(self.insideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    StrokeText(text: "\(self.teamProfile.players[index].college)", width: 1.5, color: self.insideColor)
                                                    .foregroundColor(self.outsideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                }
                                                HStack
                                                {
                                                    StrokeText(text: "College Conference: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                    .foregroundColor(self.insideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    StrokeText(text: "\(self.teamProfile.players[index].college_conf)", width: 1.5, color: self.insideColor)
                                                    .foregroundColor(self.outsideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                }
                                                HStack
                                                {
                                                    StrokeText(text: "Rookie Year: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                    .foregroundColor(self.insideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    StrokeText(text: "\(self.teamProfile.players[index].rookie_year)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                    .foregroundColor(self.outsideColor)
                                                    .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                }
                                                /*Group
                                                {
                                                    HStack
                                                    {
                                                        StrokeText(text: "Draft year: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                        .foregroundColor(self.insideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        if(self.draftYear[index] != -1)
                                                        {
                                                            StrokeText(text: "\(self.draftYear[index])", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                            .foregroundColor(self.outsideColor)
                                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        }
                                                        else
                                                        {
                                                            StrokeText(text: "Unknow", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                            .foregroundColor(self.outsideColor)
                                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        }
                                                    }
                                                    HStack
                                                    {
                                                        StrokeText(text: "Draft Round: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                        .foregroundColor(self.insideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        if(self.draftRound[index] != -1)
                                                        {
                                                            StrokeText(text: "\(self.draftRound[index])", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                            .foregroundColor(self.outsideColor)
                                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        }
                                                        else
                                                        {
                                                            StrokeText(text: "Unknow", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                            .foregroundColor(self.outsideColor)
                                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        }
                                                    }
                                                    HStack
                                                    {
                                                        StrokeText(text: "Draft Number: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                        .foregroundColor(self.insideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        if(self.draftNumber[index] != -1)
                                                        {
                                                            StrokeText(text: "\(self.draftNumber[index])", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                            .foregroundColor(self.outsideColor)
                                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        }
                                                        else
                                                        {
                                                            StrokeText(text: "Unknow", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                            .foregroundColor(self.outsideColor)
                                                            .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        }
                                                    }
                                                    HStack
                                                    {
                                                        StrokeText(text: "Draft Team: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                        .foregroundColor(self.insideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        StrokeText(text: "\(self.draftTeam[index])", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                        .foregroundColor(self.outsideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    }
                                                }*/
                                                /*if(self.teamProfile.players[index].draft != nil)
                                                {
                                                    HStack
                                                    {
                                                        StrokeText(text: "Draft year: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                        .foregroundColor(self.insideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        StrokeText(text: "\(self.teamProfile.players[index].draft!.year)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                        .foregroundColor(self.outsideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    }
                                                    HStack
                                                    {
                                                        StrokeText(text: "Draft Round: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                        .foregroundColor(self.insideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        StrokeText(text: "\(self.teamProfile.players[index].draft!.round)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                        .foregroundColor(self.outsideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    }
                                                    HStack
                                                    {
                                                        StrokeText(text: "Draft Number: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                        .foregroundColor(self.insideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        StrokeText(text: "\(self.teamProfile.players[index].draft!.number)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                        .foregroundColor(self.outsideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    }
                                                    HStack
                                                    {
                                                        StrokeText(text: "Draft Team: ", width: geometry.size.width * 1.5 / 414, color: self.outsideColor)
                                                        .foregroundColor(self.insideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                        StrokeText(text: "\(self.teamProfile.players[index].draft!.team.market) \(self.teamProfile.players[index].draft!.team.name)", width: geometry.size.width * 1.5 / 414, color: self.insideColor)
                                                        .foregroundColor(self.outsideColor)
                                                        .font(.system(size: geometry.size.width * 15 / 414, weight: .bold))
                                                    }
                                                }*/
                                            }
                                        }
                                        .padding(EdgeInsets(top: geometry.size.width * 6 / 414, leading: geometry.size.width * 6 / 414, bottom: geometry.size.width * 6 / 414, trailing: geometry.size.width * 6 / 414))
                                        .frame(width: geometry.size.width * 7 / 9)
                                        .multilineTextAlignment(.center)
                                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.orange))
                                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414)))
                                    }
                                }
                                .padding(.bottom, geometry.size.width * 20 / 414)
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: 0, trailing: geometry.size.width * 10 / 414))
                        .frame(width: geometry.size.width * 8 / 9)
                        .multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color.black, style: StrokeStyle(lineWidth: geometry.size.width * 5 / 414)))
                        Spacer()
                        .frame(height: geometry.size.width / 8)
                        .padding(.top, -geometry.size.width * 20 / 414)
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
        .onAppear()
        {
            self.setTeamName()
        }
    }
}

struct NFLTeamProfileDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        NFLTeamProfileDetail(dataComplete: .constant(true), teamProfile: NFLTeamProfileData(_comment: "1", id: "1", sr_id: "1", name: "1", market: "1", alias: "1", franchise: NFLTeamProfile_franchise(id: "1", name: "1", alias: "1", references: [NFLTeamProfile_franchise_references(id: "1", origin: "1")]), venue: NFLTeamProfile_venue(id: "1", name: "1", city: "1", state: "1", country: "1", zip: "1", address: "1", capacity: 1.00, surface: "1", roof_type: "1", sr_id: "1"), division: NFLTeamProfile_division(id: "1", name: "1", alias: "1"), conference: NFLTeamProfile_conference(id: "1", name: "1", alias: "1"), references: [NFLTeamProfile_references(id: "1", origin: "1")], coaches: [NFLTeamProfile_coaches(id: "1", full_name: "1", first_name: "1", last_name: "1", position: "1")], players: [NFLTeamProfile_players(id: "1", name: "1", jersey: "1", last_name: "1", first_name: "1", abbr_name: "1", preferred_name: "1", birth_date: "1", weight: 1, height: 1, position: "1", birth_place: "1", high_school: "1", college: "1", college_conf: "1", rookie_year: 1, status: "1", sr_id: "1", draft: NFLTeamProfile_players_draft(year: 2020, round: 1, number: 1, team: NFLTeamProfile_players_draft_team(id: "1", name: "1", market: "1", alias: "1", sr_id: "1")), references: [NFLTeamProfile_players_references(id: "1", origin: "1")])]))
    }
}
