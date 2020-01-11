//
//  NBASeasonList.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI
import NVActivityIndicatorView

struct NBASeasonList: View
{
    init(showMusicBar: Bool)
    {
        UITableView.appearance().backgroundColor = .clear
        self.showMusicBar = showMusicBar
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var seasons = [NBASeasonData]()
    @State private var WESTERN_SOUTHWEST = [NBASeason_conferences_divisions_teams]()
    @State private var WESTERN_PACIFIC = [NBASeason_conferences_divisions_teams]()
    @State private var WESTERN_NORTHWEST = [NBASeason_conferences_divisions_teams]()
    @State private var EASTERN_SOUTHEAST = [NBASeason_conferences_divisions_teams]()
    @State private var EASTERN_ATLANTIC = [NBASeason_conferences_divisions_teams]()
    @State private var EASTERN_CENTRAL = [NBASeason_conferences_divisions_teams]()
    @State private var dataComplete = false
    let loading = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30), type: .audioEqualizer, color: .green)
    @State private var searchTerm: String = ""
    @State private var showSearch = false
    @State private var listShow_SouthWest = [String]()
    @State private var listShow_Pacific = [String]()
    @State private var listShow_NorthWest = [String]()
    @State private var listShow_SouthEast = [String]()
    @State private var listShow_Altantic = [String]()
    @State private var listShow_Central = [String]()
    var showMusicBar: Bool
    func getSeason()
    {
        let apiKey = "gg4fd93s3ezyjpyem5uhjnaq"
        let urlStr = "https://api.sportradar.us/nba/trial/v7/en/seasons/2019/REG/standings.json?api_key=\(apiKey)"
        if let url = URL(string: urlStr)
        {
            print("Start!")
            URLSession.shared.dataTask(with: url)
            {
                (data,response , error) in
                let decoder = JSONDecoder()
                if let data = data, let NBASeason = try?decoder.decode(NBASeasonData.self, from: data)
                {
                    self.seasons.removeAll()
                    self.seasons.append(NBASeason)
                    //print("Data Count: \(self.seasons.count)")
                    //print("Data:\n\(self.seasons[0])")
                    self.WESTERN_SOUTHWEST.removeAll()
                    self.WESTERN_PACIFIC.removeAll()
                    self.WESTERN_NORTHWEST.removeAll()
                    self.EASTERN_SOUTHEAST.removeAll()
                    self.EASTERN_ATLANTIC.removeAll()
                    self.EASTERN_CENTRAL.removeAll()
                    self.listShow_SouthWest.removeAll()
                    self.listShow_Pacific.removeAll()
                    self.listShow_NorthWest.removeAll()
                    self.listShow_SouthEast.removeAll()
                    self.listShow_Altantic.removeAll()
                    self.listShow_Central.removeAll()
                    for index in 0..<self.seasons[0].conferences[0].divisions[0].teams.count
                    {
                        self.WESTERN_SOUTHWEST.append(self.seasons[0].conferences[0].divisions[0].teams[index])
                        let input = self.seasons[0].conferences[0].divisions[0].teams[index].market + " " + self.seasons[0].conferences[0].divisions[0].teams[index].name
                        self.listShow_SouthWest.append(input)
                    }
                    for index in 0..<self.seasons[0].conferences[0].divisions[1].teams.count
                    {
                        self.WESTERN_PACIFIC.append(self.seasons[0].conferences[0].divisions[1].teams[index])
                        let input = self.seasons[0].conferences[0].divisions[1].teams[index].market + " " + self.seasons[0].conferences[0].divisions[1].teams[index].name
                        self.listShow_Pacific.append(input)
                    }
                    for index in 0..<self.seasons[0].conferences[0].divisions[2].teams.count
                    {
                        self.WESTERN_NORTHWEST.append(self.seasons[0].conferences[0].divisions[2].teams[index])
                        let input = self.seasons[0].conferences[0].divisions[2].teams[index].market + " " + self.seasons[0].conferences[0].divisions[2].teams[index].name
                        self.listShow_NorthWest.append(input)
                    }
                    for index in 0..<self.seasons[0].conferences[1].divisions[0].teams.count
                    {
                        self.EASTERN_SOUTHEAST.append(self.seasons[0].conferences[1].divisions[0].teams[index])
                        let input = self.seasons[0].conferences[0].divisions[1].teams[index].market + " " + self.seasons[0].conferences[1].divisions[0].teams[index].name
                        self.listShow_SouthEast.append(input)
                    }
                    for index in 0..<self.seasons[0].conferences[1].divisions[1].teams.count
                    {
                        self.EASTERN_ATLANTIC.append(self.seasons[0].conferences[1].divisions[1].teams[index])
                        let input = self.seasons[0].conferences[1].divisions[1].teams[index].market + " " + self.seasons[0].conferences[1].divisions[1].teams[index].name
                        self.listShow_Altantic.append(input)
                    }
                    for index in 0..<self.seasons[0].conferences[1].divisions[2].teams.count
                    {
                        self.EASTERN_CENTRAL.append(self.seasons[0].conferences[1].divisions[2].teams[index])
                        let input = self.seasons[0].conferences[1].divisions[2].teams[index].market + " " + self.seasons[0].conferences[1].divisions[2].teams[index].name
                        self.listShow_Central.append(input)
                    }
                    self.dataComplete = true
                    //self.loading.stopAnimating()
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
                        let NBASeason = try decoder.decode(NBASeasonData.self, from: data)
                        print(NBASeason)
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
                            Section(header: Text("Western(South West)"))
                            {
                                ForEach(self.listShow_SouthWest.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NBASeasonLink(dataComplete: self.$dataComplete, teams: self.WESTERN_SOUTHWEST, listShow: self.listShow_SouthWest, target: index)
                                }
                            }
                            Section(header: Text("Western(Pacific)"))
                            {
                                ForEach(self.listShow_Pacific.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NBASeasonLink(dataComplete: self.$dataComplete, teams: self.WESTERN_PACIFIC, listShow: self.listShow_Pacific, target: index)
                                }
                            }
                            Section(header: Text("Western(North West)"))
                            {
                                ForEach(self.listShow_NorthWest.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NBASeasonLink(dataComplete: self.$dataComplete, teams: self.WESTERN_NORTHWEST, listShow: self.listShow_NorthWest, target: index)
                                }
                            }
                            Section(header: Text("Eastern(South East)"))
                            {
                                ForEach(self.listShow_SouthEast.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NBASeasonLink(dataComplete: self.$dataComplete, teams: self.EASTERN_SOUTHEAST, listShow: self.listShow_SouthEast, target: index)
                                }
                            }
                            Section(header: Text("Eastern(Altantic)"))
                            {
                                ForEach(self.listShow_Altantic.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NBASeasonLink(dataComplete: self.$dataComplete, teams: self.EASTERN_ATLANTIC, listShow: self.listShow_Altantic, target: index)
                                }
                            }
                            Section(header: Text("Eastern(Central)"))
                            {
                                ForEach(self.listShow_Central.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NBASeasonLink(dataComplete: self.$dataComplete, teams: self.EASTERN_CENTRAL, listShow: self.listShow_Central, target: index)
                                }
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
            .navigationBarTitle(self.dataComplete == true ? "Season" : "")
            .navigationBarItems(leading: Button(action:
            {
                self.dataComplete = false
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)}, trailing: SearchButton(dataComplete: self.$dataComplete, showSearch: self.$showSearch, searchTerm: self.$searchTerm))
        }
        .onAppear
        {
            self.getSeason()
        }
    }
}

struct NBASeasonList_Previews: PreviewProvider
{
    static var previews: some View
    {
        NBASeasonList(showMusicBar: true)
    }
}

struct NBASeasonLink: View
{
    @Binding var dataComplete: Bool
    var teams: [NBASeason_conferences_divisions_teams]
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
                NavigationLink(destination: NBASeasonDetail(dataComplete: $dataComplete, team: teams[index]))
                {
                    NBASeasonRow(team: teams[index])
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
