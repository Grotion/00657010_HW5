//
//  NBAFreeAgentDetail.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI
 
struct NBAFreeAgentDetail: View
{
    @Environment(\.presentationMode) var presentationMode
    @Binding var dataComplete: Bool
    var freeAgent: NBAFreeAgent_freeagent
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
                                    Text("\(self.freeAgent.full_name)")
                                }
                                HStack
                                {
                                    Text("Height: ")
                                    Text("\(self.freeAgent.height)")
                                    Text(" cm")
                                }
                                HStack
                                {
                                    Text("Weight: ")
                                    Text("\(self.freeAgent.weight)")
                                    Text(" lbs")
                                }
                                if(self.freeAgent.birth_place != nil)
                                {
                                    HStack
                                    {
                                        Text("Birth Place: ")
                                        Text("\(self.freeAgent.birth_place!)")
                                    }
                                }
                                if(self.freeAgent.birthdate != nil)
                                {
                                    HStack
                                    {
                                        Text("Birthday: ")
                                        Text("\(self.freeAgent.birthdate!)")
                                    }
                                }
                                if(self.freeAgent.high_school != nil)
                                {
                                    HStack
                                    {
                                        Text("High School: ")
                                        Text("\(self.freeAgent.high_school!)")
                                    }
                                }
                                if(self.freeAgent.college != nil)
                                {
                                    HStack
                                    {
                                        Text("College: ")
                                        Text("\(self.freeAgent.college!)")
                                    }
                                }
                                HStack
                                {
                                    Text("Position: ")
                                    Text("\(self.freeAgent.position)")
                                }
                                HStack
                                {
                                    Text("Primary Position: ")
                                    Text("\(self.freeAgent.primary_position)")
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
 
struct NBAFreeAgentDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        NBAFreeAgentDetail(dataComplete: .constant(true), freeAgent: NBAFreeAgent_freeagent(id:"001ddcf1-824c-4289-86e4-a6d57a897ce1",status:"FA",full_name:"Ryan Taylor",first_name:"Ryan",last_name:"Taylor",abbr_name:"R.Taylor",height:78,weight:190,position:"G",primary_position:"SG",experience:"0",college:"Northwestern",high_school:"St. John's Northwestern Military Academy (WI)",birth_place:"Gary, IN, USA",birthdate:"1995-02-01",updated:"2019-12-18T18:01:14+00:00"))
    }
}
