//
//  NFLDraftList.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/1.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI
import NVActivityIndicatorView

struct NFLDraftList: View
{
    init(showMusicBar: Bool)
    {
        UITableView.appearance().backgroundColor = .clear
        self.showMusicBar = showMusicBar
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var drafts = [NFLDraftData]()
    @State private var picks = [NFLDraft_rounds_picks]()
    @State private var dataComplete = false
    let loading = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30), type: .ballGridPulse, color: .green)
    @State private var searchTerm: String = ""
    @State private var showSearch = false
    @State private var listShow = [String]()
    var showMusicBar: Bool
    func getDrafts()
    {
        let apiKey = "ep349buzksqzzbwggsg7pqhf"
        let urlStr = "https://api.sportradar.us/draft/nfl/trial/v1/en/2019/draft.json?api_key=\(apiKey)"
        if let url = URL(string: urlStr)
        {
            print("Start!")
            URLSession.shared.dataTask(with: url)
            {
                (data,response , error) in
                let decoder = JSONDecoder()
                if let data = data, let NFLDraft = try?decoder.decode(NFLDraftData.self, from: data)
                {
                    self.drafts.removeAll()
                    self.drafts.append(NFLDraft)
                    //print("Data Count: \(self.drafts.count)")
                    self.picks.removeAll()
                    self.listShow.removeAll()
                    for index1 in 0..<self.drafts[0].rounds.count
                    {
                        for index2 in 0..<self.drafts[0].rounds[index1].picks.count
                        {
                            self.picks.append(self.drafts[0].rounds[index1].picks[index2])
                            let input = "No.\(self.drafts[0].rounds[index1].picks[index2].overall)\t\( self.drafts[0].rounds[index1].picks[index2].prospect.name)(\(self.drafts[0].rounds[index1].picks[index2].team.alias))"
                            self.listShow.append(input)
                        }
                    }
                    //print("Teams\n\(self.picks)")
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
                        let NFLDraft = try decoder.decode(NFLDraftData.self, from: data)
                        print(NFLDraft)
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
                                NFLDraftLink(dataComplete: self.$dataComplete, picks: self.picks, listShow: self.listShow, target: index)
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
            .navigationBarTitle(self.dataComplete == true ? "Draft" : "")
            .navigationBarItems(leading: Button(action:
            {
                self.dataComplete = false
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)}, trailing: SearchButton(dataComplete: self.$dataComplete, showSearch: self.$showSearch, searchTerm: self.$searchTerm))
        }
        .onAppear
        {
            self.getDrafts()
        }
    }
}

struct NFLDraftList_Previews: PreviewProvider
{
    static var previews: some View
    {
        NFLDraftList(showMusicBar: true)
    }
}

struct NFLDraftLink: View
{
    @Binding var dataComplete: Bool
    var picks: [NFLDraft_rounds_picks]
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
                NavigationLink(destination: NFLDraftDetail(dataComplete: self.$dataComplete, pick: picks[index]))
                {
                    NFLDraftRow(pick: picks[index])
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
