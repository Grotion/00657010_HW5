//
//  NFLStandingsList.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/1.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI
import NVActivityIndicatorView

struct NFLStandingsList: View
{
    init(showMusicBar: Bool)
    {
        UITableView.appearance().backgroundColor = .clear
        self.showMusicBar = showMusicBar
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var standings = [NFLStandingsData]()
    @State private var AFC_EAST = [NFLStandings_conferences_divisions_teams]()
    @State private var AFC_NORTH = [NFLStandings_conferences_divisions_teams]()
    @State private var AFC_SOUTH = [NFLStandings_conferences_divisions_teams]()
    @State private var AFC_WEST = [NFLStandings_conferences_divisions_teams]()
    @State private var NFC_EAST = [NFLStandings_conferences_divisions_teams]()
    @State private var NFC_NORTH = [NFLStandings_conferences_divisions_teams]()
    @State private var NFC_SOUTH = [NFLStandings_conferences_divisions_teams]()
    @State private var NFC_WEST = [NFLStandings_conferences_divisions_teams]()
    @State private var dataComplete = false
    let loading = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30), type: .ballScaleMultiple, color: .green)
    @State private var searchTerm: String = ""
    @State private var showSearch = false
    @State private var listShow_AFC_EAST = [String]()
    @State private var listShow_AFC_NORTH = [String]()
    @State private var listShow_AFC_SOUTH = [String]()
    @State private var listShow_AFC_WEST = [String]()
    @State private var listShow_NFC_EAST = [String]()
    @State private var listShow_NFC_NORTH = [String]()
    @State private var listShow_NFC_SOUTH = [String]()
    @State private var listShow_NFC_WEST = [String]()
    var showMusicBar: Bool
    func getStandings()
    {
        let apiKey = "ep349buzksqzzbwggsg7pqhf"
        let urlStr = "https://api.sportradar.us/nfl/official/trial/v5/en/seasons/2019/standings.json?api_key=\(apiKey)"
        if let url = URL(string: urlStr)
        {
            print("Start!")
            URLSession.shared.dataTask(with: url)
            {
                (data,response , error) in
                let decoder = JSONDecoder()
                if let data = data, let NFLStandings = try?decoder.decode(NFLStandingsData.self, from: data)
                {
                    self.standings.removeAll()
                    self.standings.append(NFLStandings)
                    //print("Data Count: \(self.standings.count)")
                    self.AFC_EAST.removeAll()
                    self.AFC_NORTH.removeAll()
                    self.AFC_SOUTH.removeAll()
                    self.AFC_WEST.removeAll()
                    self.NFC_EAST.removeAll()
                    self.NFC_NORTH.removeAll()
                    self.NFC_SOUTH.removeAll()
                    self.NFC_WEST.removeAll()
                    self.listShow_AFC_EAST.removeAll()
                    self.listShow_AFC_NORTH.removeAll()
                    self.listShow_AFC_SOUTH.removeAll()
                    self.listShow_AFC_WEST.removeAll()
                    self.listShow_NFC_EAST.removeAll()
                    self.listShow_NFC_NORTH.removeAll()
                    self.listShow_NFC_SOUTH.removeAll()
                    self.listShow_NFC_WEST.removeAll()
                    for index in 0..<self.standings[0].conferences[0].divisions[0].teams.count
                    {
                        self.AFC_EAST.append(self.standings[0].conferences[0].divisions[0].teams[index])
                        let input = self.standings[0].conferences[0].divisions[0].teams[index].market + " " + self.standings[0].conferences[0].divisions[0].teams[index].name
                        self.listShow_AFC_EAST.append(input)
                    }
                    for index in 0..<self.standings[0].conferences[0].divisions[1].teams.count
                    {
                        self.AFC_NORTH.append(self.standings[0].conferences[0].divisions[1].teams[index])
                        let input = self.standings[0].conferences[0].divisions[1].teams[index].market + " " + self.standings[0].conferences[0].divisions[1].teams[index].name
                        self.listShow_AFC_NORTH.append(input)
                    }
                    for index in 0..<self.standings[0].conferences[0].divisions[2].teams.count
                    {
                        self.AFC_SOUTH.append(self.standings[0].conferences[0].divisions[2].teams[index])
                        let input = self.standings[0].conferences[0].divisions[2].teams[index].market + " " + self.standings[0].conferences[0].divisions[2].teams[index].name
                        self.listShow_AFC_SOUTH.append(input)
                    }
                    for index in 0..<self.standings[0].conferences[0].divisions[3].teams.count
                    {
                        self.AFC_WEST.append(self.standings[0].conferences[0].divisions[3].teams[index])
                        let input = self.standings[0].conferences[0].divisions[3].teams[index].market + " " + self.standings[0].conferences[0].divisions[3].teams[index].name
                        self.listShow_AFC_WEST.append(input)
                    }
                    for index in 0..<self.standings[0].conferences[1].divisions[0].teams.count
                    {
                        self.NFC_EAST.append(self.standings[0].conferences[1].divisions[0].teams[index])
                        let input = self.standings[0].conferences[1].divisions[0].teams[index].market + " " + self.standings[0].conferences[1].divisions[0].teams[index].name
                        self.listShow_NFC_EAST.append(input)
                    }
                    for index in 0..<self.standings[0].conferences[1].divisions[1].teams.count
                    {
                        self.NFC_NORTH.append(self.standings[0].conferences[1].divisions[1].teams[index])
                        let input = self.standings[0].conferences[1].divisions[1].teams[index].market + " " + self.standings[0].conferences[1].divisions[1].teams[index].name
                        self.listShow_NFC_NORTH.append(input)
                    }
                    for index in 0..<self.standings[0].conferences[1].divisions[2].teams.count
                    {
                        self.NFC_SOUTH.append(self.standings[0].conferences[1].divisions[2].teams[index])
                        let input = self.standings[0].conferences[1].divisions[2].teams[index].market + " " + self.standings[0].conferences[1].divisions[2].teams[index].name
                        self.listShow_NFC_SOUTH.append(input)
                    }
                    for index in 0..<self.standings[0].conferences[1].divisions[3].teams.count
                    {
                        self.NFC_WEST.append(self.standings[0].conferences[1].divisions[3].teams[index])
                        let input = self.standings[0].conferences[1].divisions[3].teams[index].market + " " + self.standings[0].conferences[1].divisions[3].teams[index].name
                        self.listShow_NFC_WEST.append(input)
                    }
                    //print("Teams\n\(self.teams)")
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
                        let NFLStandings = try decoder.decode(NFLStandingsData.self, from: data)
                        print(NFLStandings)
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
                            Section(header: Text("ACF East"))
                            {
                                ForEach(self.listShow_AFC_EAST.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NFLStandingsLink(dataComplete: self.$dataComplete, teams: self.AFC_EAST, listShow: self.listShow_AFC_EAST, target: index)
                                }
                            }
                            Section(header: Text("ACF North"))
                            {
                                ForEach(self.listShow_AFC_NORTH.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NFLStandingsLink(dataComplete: self.$dataComplete, teams: self.AFC_NORTH, listShow: self.listShow_AFC_NORTH, target: index)
                                }
                            }
                            Section(header: Text("ACF South"))
                            {
                                ForEach(self.listShow_AFC_SOUTH.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NFLStandingsLink(dataComplete: self.$dataComplete, teams: self.AFC_SOUTH, listShow: self.listShow_AFC_SOUTH, target: index)
                                }
                            }
                            Section(header: Text("ACF West"))
                            {
                                ForEach(self.listShow_AFC_WEST.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NFLStandingsLink(dataComplete: self.$dataComplete, teams: self.AFC_WEST, listShow: self.listShow_AFC_WEST, target: index)
                                }
                            }
                            Section(header: Text("NCF East"))
                            {
                                ForEach(self.listShow_NFC_EAST.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NFLStandingsLink(dataComplete: self.$dataComplete, teams: self.NFC_EAST, listShow: self.listShow_NFC_EAST, target: index)
                                }
                            }
                            Section(header: Text("NCF North"))
                            {
                                ForEach(self.listShow_NFC_NORTH.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NFLStandingsLink(dataComplete: self.$dataComplete, teams: self.NFC_NORTH, listShow: self.listShow_NFC_NORTH, target: index)
                                }
                            }
                            Section(header: Text("NCF South"))
                            {
                                ForEach(self.listShow_NFC_SOUTH.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NFLStandingsLink(dataComplete: self.$dataComplete, teams: self.NFC_SOUTH, listShow: self.listShow_NFC_SOUTH, target: index)
                                }
                            }
                            Section(header: Text("NCF West"))
                            {
                                ForEach(self.listShow_NFC_WEST.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                                {
                                    (index)  in
                                    NFLStandingsLink(dataComplete: self.$dataComplete, teams: self.NFC_WEST, listShow: self.listShow_NFC_WEST, target: index)
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
            .navigationBarTitle(self.dataComplete == true ? "Standings" : "")
            .navigationBarItems(leading: Button(action:
            {
                self.dataComplete = false
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)}, trailing: SearchButton(dataComplete: self.$dataComplete, showSearch: self.$showSearch, searchTerm: self.$searchTerm))
        }
        .onAppear
        {
            self.getStandings()
        }
    }
}

struct NFLStandingsList_Previews: PreviewProvider
{
    static var previews: some View
    {
        NFLStandingsList(showMusicBar: true)
    }
}

struct NFLStandingsLink: View
{
    @Binding var dataComplete: Bool
    var teams: [NFLStandings_conferences_divisions_teams]
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
                NavigationLink(destination: NFLStandingsDetail(dataComplete: $dataComplete, team: teams[index]))
                {
                    NFLStandingsRow(team: teams[index])
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
