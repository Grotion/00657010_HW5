//
//  NFLTeamProfileList.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/1.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI
import NVActivityIndicatorView

struct NFLTeamProfileList: View
{
    init(showMusicBar: Bool)
    {
        UITableView.appearance().backgroundColor = .clear
        self.showMusicBar = showMusicBar
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var teamProfiles = [NFLTeamProfileData]()
    @State private var dataComplete = false
    let loading = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30), type: .audioEqualizer, color: .green)
    @State private var searchTerm: String = ""
    @State private var showSearch = false
    @State private var listShow = [String]()
    var showMusicBar: Bool
    func getTeamProfileData()
    {
        let apiKey = "ep349buzksqzzbwggsg7pqhf"
        let urlStr = "https://api.sportradar.us/nfl/official/trial/v5/en/teams/97354895-8c77-4fd4-a860-32e62ea7382a/profile.json?api_key=\(apiKey)"
        if let url = URL(string: urlStr)
        {
            print("Start!")
            URLSession.shared.dataTask(with: url)
            {
                (data,response , error) in
                let decoder = JSONDecoder()
                if let data = data, let NFLTeamProfile = try?decoder.decode(NFLTeamProfileData.self, from: data)
                {
                    self.teamProfiles.removeAll()
                    self.teamProfiles.append(NFLTeamProfile)
                    //print("Team Profile: \(self.teamProfiles)")
                    self.listShow.removeAll()
                    for index in 0..<self.teamProfiles.count
                    {
                        let input = self.teamProfiles[index].market + " " + self.teamProfiles[index].name
                        self.listShow.append(input)
                    }
                    print("Get!")
                    self.dataComplete = true
                }
            }.resume()
        }
        /*if let url = URL(string: urlStr)
        {
            URLSession.shared.dataTask(with: url)
            {
                (data,response , error) in
                let decoder = JSONDecoder()
                if let data = data
                {
                    do
                    {
                        let NFLTeamProfile = try decoder.decode(NFLTeamProfileData.self, from: data)
                        print(NFLTeamProfile)
                    }
                    catch
                    {
                        print(error)
                    }
                }
            }.resume()
        }*/
    }
    var body: some View
    {
        GeometryReader
        {
            geometry in
            ZStack
            {
                if(self.dataComplete == false)
                {
                    Image("listBackground")
                    .resizable()
                    .opacity(0.5)
                    .frame(width: geometry.size.width)
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    VStack(alignment: .center)
                    {
                        VStack(alignment: .leading)
                        {
                            Group
                            {
                                Text("Data Loading...")
                                Text("Please Wait!")
                            }
                            .foregroundColor(.white)
                        }
                        LoadingViewController(loading: self.loading)
                        .padding(.top, geometry.size.width * 30 / 414)
                    }
                    .frame(height: geometry.size.width * 100 / 414)
                }
                else
                {
                    Image("StatsBackground")
                    .resizable()
                    .opacity(0.3)
                    .frame(width: geometry.size.width)
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    VStack
                    {
                        List
                        {
                            if(self.showSearch)
                            {
                                SearchBar(text: self.$searchTerm)
                            }
                            ForEach(self.listShow.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                            {
                                (index)  in
                                NFLTeamProfileLink(dataComplete: self.$dataComplete, teamProfiles: self.teamProfiles, listShow: self.listShow, target: index)
                            }
                        }
                        if(self.showMusicBar)
                        {
                            Spacer()
                            .frame(height: geometry.size.width / 8)
                        }
                    }
                    Path(CGRect(x:0,y:-geometry.size.width * 500 / 414,width: geometry.size.width, height: geometry.size.width * 500 / 414)).fill(nagvigationBarColor1)
                }
            }
            .navigationBarTitle(self.dataComplete == true ? "Team Profile" : "")
            .navigationBarItems(leading: Button(action:
            {
                self.dataComplete = false
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)}, trailing: SearchButton(dataComplete: self.$dataComplete, showSearch: self.$showSearch, searchTerm: self.$searchTerm))
        }
        .onAppear
        {
            self.getTeamProfileData()
        }
    }
}

struct NFLTeamProfileList_Previews: PreviewProvider
{
    static var previews: some View
    {
        NFLTeamProfileList(showMusicBar: true)
    }
}

struct NFLTeamProfileLink: View
{
    @Binding var dataComplete: Bool
    var teamProfiles: [NFLTeamProfileData]
    var listShow: [String]
    var target: String
    @State private var index: Int = -1
    func findIndex()
    {
        self.index = self.listShow.firstIndex(of: target) ?? -1
    }
    var body: some View
    {
        ZStack
        {
            if(index != -1)
            {
                NavigationLink(destination: NFLTeamProfileDetail(dataComplete: self.$dataComplete, teamProfile: teamProfiles[index]))
                {
                    NFLTeamProfileRow(teamProfile: teamProfiles[index])
                }
            }
            else
            {
                Text("Loading...")
            }
        }
        .onAppear()
        {
            self.findIndex()
        }
    }
}
