//
//  NBAFreeAgentList.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI
import NVActivityIndicatorView
 
struct NBAFreeAgentList: View
{
    init(showMusicBar: Bool)
    {
        UITableView.appearance().backgroundColor = .clear
        self.showMusicBar = showMusicBar
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var freeAgents = [NBAFreeAgentData]()
    @State private var free_agents = [NBAFreeAgent_freeagent]()
    @State private var dataComplete = false
    let loading = NVActivityIndicatorView(frame: CGRect(x:0, y:0, width: 40, height: 40), type: .pacman, color: .green)
    @State private var searchTerm: String = ""
    @State private var showSearch = false
    @State private var listShow = [String]()
    var showMusicBar: Bool
    func getFreeAgent()
    {
        //print("Data complete:\(self.dataComplete)")
        let apiKey = "gg4fd93s3ezyjpyem5uhjnaq"
        let urlStr = "https://api.sportradar.us/nba/trial/v7/en/league/free_agents.json?api_key=\(apiKey)"
        if let url = URL(string: urlStr)
        {
            print("Start!")
            URLSession.shared.dataTask(with: url)
            {
                (data,response , error) in
                let decoder = JSONDecoder()
                if let data = data, let NBAFreeAgent = try?decoder.decode(NBAFreeAgentData.self, from: data)
                {
                    self.freeAgents.removeAll()
                    self.freeAgents.append(NBAFreeAgent)
                    //print("Data Count: \(self.freeAgents.count)")
                    //print("Data:\n\(self.freeAgents[0])")
                    self.free_agents.removeAll()
                    self.listShow.removeAll()
                    for index1 in 0..<self.freeAgents[0].free_agents.count
                    {
                        self.free_agents.append(self.freeAgents[0].free_agents[index1])
                        self.listShow.append(self.freeAgents[0].free_agents[index1].abbr_name)
                    }
                    print("Get!")
                    self.dataComplete = true
                    //self.loading.stopAnimating()
                    //print("Data complete:\(self.dataComplete)")
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
                        let NBAFreeAgent = try decoder.decode(NBAFreeAgentData.self, from: data)
                        print(NBAFreeAgent)
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
                                NBAFreeAgentLink(dataComplete: self.$dataComplete, freeAgents: self.free_agents, listShow: self.listShow, target: index)
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
            .navigationBarTitle(self.dataComplete == true ? "Free Agent" : "")
            .navigationBarItems(leading: Button(action:
            {
                self.dataComplete = false
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)}, trailing: SearchButton(dataComplete: self.$dataComplete, showSearch: self.$showSearch, searchTerm: self.$searchTerm))
        }
        .onAppear
        {
            self.getFreeAgent()
        }
    }
}
 
struct NBAFreeAgentList_Previews: PreviewProvider
{
    static var previews: some View
    {
        NBAFreeAgentList(showMusicBar: true)
    }
}

struct NBAFreeAgentLink: View
{
    @Binding var dataComplete: Bool
    var freeAgents: [NBAFreeAgent_freeagent]
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
                NavigationLink(destination: NBAFreeAgentDetail(dataComplete: $dataComplete, freeAgent: freeAgents[index]))
                {
                    NBAFreeAgentRow(freeAgent: freeAgents[index])
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
