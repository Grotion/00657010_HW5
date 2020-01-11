//
//  NBALeaderList.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/31.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI
import NVActivityIndicatorView

struct NBALeaderList: View
{
    init(showMusicBar: Bool)
    {
        UITableView.appearance().backgroundColor = .clear
        self.showMusicBar = showMusicBar
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var leaders = [NBALeaderData]()
    @State private var categories = [NBALeader_categories]()
    @State private var dataComplete = false
    let loading = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30), type: .ballClipRotatePulse, color: .green)
    @State private var searchTerm: String = ""
    @State private var showSearch = false
    @State private var listShow = [String]()
    var showMusicBar: Bool
    let lowerCase = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    let upperCase = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "X"]
    func getLeader()
    {
        let apiKey = "gg4fd93s3ezyjpyem5uhjnaq"
        let urlStr = "https://api.sportradar.us/nba/trial/v7/en/seasons/2019/REG/leaders.json?api_key=\(apiKey)"
        if let url = URL(string: urlStr)
        {
            print("Start!")
            URLSession.shared.dataTask(with: url)
            {
                (data,response , error) in
                let decoder = JSONDecoder()
                if let data = data, let NBALeader = try?decoder.decode(NBALeaderData.self, from: data)
                {
                    self.leaders.removeAll()
                    self.leaders.append(NBALeader)
                    //print("Data Count: \(self.leaders.count)")
                    //print("Data:\n\(self.leaders[0])")
                    self.categories.removeAll()
                    self.listShow.removeAll()
                    for index1 in 0..<self.leaders[0].categories.count
                    {
                        self.categories.append(self.leaders[0].categories[index1])
                        var newName = self.leaders[0].categories[index1].name.replacingOccurrences(of: "_", with: " ")
                        var newType = self.leaders[0].categories[index1].type
                        newName = newName.replacingOccurrences(of: " att", with: " attempts")
                        newName = newName.replacingOccurrences(of: "tech ", with: "technical ")
                        newName = newName.replacingOccurrences(of: " pct", with: " percentage")
                        newName = newName.replacingOccurrences(of: "off ", with: "offensive ")
                        newName = newName.replacingOccurrences(of: "def ", with: "defensive")
                        for index in 0..<26
                        {
                            newName = newName.replacingOccurrences(of: " \(self.lowerCase[index])", with: " \(self.upperCase[index])")
                        }
                        for index in 0..<26
                        {
                            newName = newName.replacingOccurrences(of: " \(self.lowerCase[index])", with: " \(self.upperCase[index])")
                        }
                        for index in 0..<26
                        {
                            if(newName.prefix(1) == self.lowerCase[index])
                            {
                                newName = newName.replacingCharacters(in: ...newName.startIndex, with: self.upperCase[index])
                            }
                            if(newType.prefix(1) == self.lowerCase[index])
                            {
                                newType = newType.replacingCharacters(in: ...newType.startIndex, with: self.upperCase[index])
                            }
                        }
                        let input = newName + "(" + newType + ")"
                        self.listShow.append(input)
                    }
                    print("Get!")
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
                        let NBALeader = try decoder.decode(NBALeaderData.self, from: data)
                        print(NBALeader)
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
                                NBALeaderLink(dataComplete: self.$dataComplete, categories: self.categories, listShow: self.listShow, target: index)
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
            .navigationBarTitle(self.dataComplete == true ? "Leader" : "")
            .navigationBarItems(leading: Button(action:
            {
                self.dataComplete = false
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)}, trailing: SearchButton(dataComplete: self.$dataComplete, showSearch: self.$showSearch, searchTerm: self.$searchTerm))
        }
        .onAppear
        {
            self.getLeader()
        }
    }
}

struct NBALeaderList_Previews: PreviewProvider
{
    static var previews: some View
    {
        NBALeaderList(showMusicBar: true)
    }
}

struct NBALeaderLink: View
{
    @Binding var dataComplete: Bool
    var categories: [NBALeader_categories]
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
                NavigationLink(destination: NBALeaderDetail(dataComplete: $dataComplete, category: categories[index]))
                {
                    NBALeaderRow(category: categories[index])
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
