//
//  F1TeamProfileList.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI
import NVActivityIndicatorView

struct F1TeamProfileList: View
{
    init(showMusicBar: Bool)
    {
        UITableView.appearance().backgroundColor = .clear
        self.showMusicBar = showMusicBar
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var teamProfiles = [F1TeamProfileData]()
    @State private var dataComplete = false
    let loading = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30), type: .ballSpinFadeLoader, color: .green)
    @State private var searchTerm: String = ""
    @State private var showSearch = false
    @State private var listShow = [String]()
    var showMusicBar: Bool
    func getTeamProfileData()
    {
        let apiKey = "uhjp9yekd5ntda5saqpfjpbp"
        let urlStr = "https://api.sportradar.us/formula1/trial/v2/en/competitors/sr:competitor:41127/profile.json?api_key=\(apiKey)"
        if let url = URL(string: urlStr)
        {
            print("Start!")
            URLSession.shared.dataTask(with: url)
            {
                (data,response , error) in
                let decoder = JSONDecoder()
                if let data = data, let F1Competitor = try?decoder.decode(F1TeamProfileData.self, from: data)
                {
                    self.teamProfiles.removeAll()
                    self.teamProfiles.append(F1Competitor)
                    self.listShow.removeAll()
                    for index in 0..<self.teamProfiles.count
                    {
                        self.listShow.append(self.teamProfiles[index].team.name)
                    }
                    print("Get!")
                    self.dataComplete = true
                }
                //print(self.teamProfiles)
            }.resume()
        }
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
                                F1TeamProfileLink(dataComplete: self.$dataComplete, teamProfiles: self.teamProfiles, listShow: self.listShow, target: index)
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

struct F1TeamProfileList_Previews: PreviewProvider
{
    static var previews: some View
    {
        F1TeamProfileList(showMusicBar: true)
    }
}

struct F1TeamProfileLink: View
{
    @Binding var dataComplete: Bool
    var teamProfiles: [F1TeamProfileData]
    var listShow: [String]
    var target: String
    @State private var index = -1
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
                NavigationLink(destination: F1TeamProfileDetail(dataComplete: $dataComplete, teamProfile: teamProfiles[index]))
                {
                    F1TeamProfileRow(teamProfile: teamProfiles[index])
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
