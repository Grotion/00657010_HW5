//
//  F1CompetitorList.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI
import NVActivityIndicatorView

struct F1CompetitorList: View
{
    init(showMusicBar: Bool)
    {
        UITableView.appearance().backgroundColor = .clear
        self.showMusicBar = showMusicBar
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var competitors = [F1CompetitorData]()
    @State private var dataComplete = false
    @State private var searchTerm: String = ""
    @State private var showSearch = false
    @State private var listShow = [String]()
    let loading = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30), type: .lineScale, color: .green)
    var showMusicBar: Bool
    func getCompetitorsData()
    {
        let apiKey = "uhjp9yekd5ntda5saqpfjpbp"
        let urlStr = "https://api.sportradar.us/formula1/trial/v2/en/competitors/sr:competitor:7135/profile.json?api_key=\(apiKey)"
        if let url = URL(string: urlStr)
        {
            print("Start!")
            URLSession.shared.dataTask(with: url)
            {
                (data,response , error) in
                let decoder = JSONDecoder()
                if let data = data, let F1Competitor = try?decoder.decode(F1CompetitorData.self, from: data)
                {
                    self.competitors.removeAll()
                    self.competitors.append(F1Competitor)
                    self.listShow.removeAll()
                    for index in 0..<self.competitors.count
                    {
                        var names = self.competitors[index].competitor.name.split(separator: ",")
                        let lastName = String(names[0])
                        names = self.competitors[index].competitor.name.split(separator: " ")
                        let firstName = String(names[1])
                        let show = firstName + " " + lastName + "(" + self.competitors[index].competitor.country_code + ")"
                        self.listShow.append(show)
                    }
                    //print(self.listShow.count)
                    print("Get!")
                    self.dataComplete = true
                }
                //print(self.competitors)
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
                                F1CompetitorLink(dataComplete: self.$dataComplete, competitors: self.competitors, listShow: self.listShow, target: index)
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
            .navigationBarTitle(self.dataComplete == true ? "Competitor" : "")
            .navigationBarItems(leading: Button(action:
            {
                self.dataComplete = false
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)}, trailing: SearchButton(dataComplete: self.$dataComplete, showSearch: self.$showSearch, searchTerm: self.$searchTerm))
        }
        .onAppear
        {
            self.getCompetitorsData()
        }
    }
}

struct F1CompetitorList_Previews: PreviewProvider
{
    static var previews: some View
    {
        F1CompetitorList(showMusicBar: true)
    }
}

struct F1CompetitorLink: View
{
    @Binding var dataComplete: Bool
    var competitors: [F1CompetitorData]
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
                NavigationLink(destination: F1CompetitorDetail(dataComplete: self.$dataComplete, competitor: competitors[index]))
                {
                    F1CompetitorRow(competitor: competitors[index])
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
