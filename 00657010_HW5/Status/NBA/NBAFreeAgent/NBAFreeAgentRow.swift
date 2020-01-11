//
//  NBAFreeAgentRow.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI
 
struct NBAFreeAgentRow: View
{
    var freeAgent: NBAFreeAgent_freeagent
    var body: some View
    {
        Text(self.freeAgent.abbr_name)
    }
}
 
struct NBAFreeAgentRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        NBAFreeAgentRow(freeAgent: NBAFreeAgent_freeagent(id:"001ddcf1-824c-4289-86e4-a6d57a897ce1",status:"FA",full_name:"Ryan Taylor",first_name:"Ryan",last_name:"Taylor",abbr_name:"R.Taylor",height:78,weight:190,position:"G",primary_position:"SG",experience:"0",college:"Northwestern",high_school:"St. John's Northwestern Military Academy (WI)",birth_place:"Gary, IN, USA",birthdate:"1995-02-01",updated:"2019-12-18T18:01:14+00:00"))
    }
}
