//
//  MusicList.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/7.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI
import NVActivityIndicatorView
import AVFoundation

struct MusicList: View
{
    init(player: AVQueuePlayer, isPlay: Binding<Bool>, selectedSong: Binding<Int>, originalSong: Binding<Int>, favoriteSongs: FavoriteSongs)
    {
        UITableView.appearance().backgroundColor = .clear
        self.player = player
        self._originalSong = originalSong
        self._isPlay = isPlay
        self._selectedSong = selectedSong
        self.favoriteSongs = favoriteSongs
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var isSelected = false
    @State private var dataComplete = false
    @State private var searchTerm: String = ""
    @State private var showSearch = false
    @State private var listShow = [String]()
    @State private var listShow_favorite = [String]()
    let loading = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30), type: .lineScale, color: .green)
    var player: AVQueuePlayer
    @Binding var isPlay: Bool
    @Binding var selectedSong: Int
    @Binding var originalSong: Int
    @State private var removeFavoriteAll = false
    var favoriteSongs: FavoriteSongs
    func getSongs()
    {
        self.listShow_favorite.removeAll()
        self.listShow.removeAll()
        for index in 0..<songs.count
        {
            let input = (songs[index].singer ?? "Unknow") + " - " + songs[index].songName
            self.listShow.append(input)
        }
        for favoriteSong in self.favoriteSongs.favoriteSong
        {
            let input = (favoriteSong.singer ?? "Unknow") + " - " + favoriteSong.songName
            self.listShow_favorite.append(input)
        }
        //print("Initial Favorite List: \(self.listShow_favorite)")
        for index in 0..<listShow_favorite.count
        {
            let targetIndex = self.listShow.firstIndex(of: listShow_favorite[index]) ?? -1
            if(targetIndex != -1)
            {
                //print("Initial: Found!At: \(targetIndex)")
                songs[targetIndex].isFavorite = true
            }
            else
            {
                //print("Initial: Not Found!")
            }
        }
        self.dataComplete = true
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
                        Text("Data Loading...\nPlease Wait!")
                        .foregroundColor(.white)
                        LoadingViewController(loading: self.loading)
                        .padding(.top, geometry.size.width * 30 / 414)
                    }
                    .frame(height: geometry.size.width * 100 / 414)
                }
                else
                {
                    Image("settingBackground")
                    .resizable()
                    .opacity(0.3)
                    .frame(width: geometry.size.width)
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    List
                    {
                        Section(header: Text("Search").foregroundColor(.black).fontWeight(.bold))
                        {
                            if(self.showSearch)
                            {
                                SearchBar(text: self.$searchTerm)
                            }
                        }
                        Section(header: Text("Fvorite").foregroundColor(.black).fontWeight(.bold))
                        {
                            ForEach(self.listShow_favorite.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                            {
                                (index)  in
                                SongsLink(dataComplete: self.$dataComplete, listShow: self.listShow, target: index, isSelected: self.$isSelected, player: self.player, isPlay: self.$isPlay, selectedSong: self.$selectedSong, originalSong: self.$originalSong, favoriteSongs: self.favoriteSongs, listShow_favorite: self.$listShow_favorite)
                            }
                        }
                        Section(header: Text("Songs").foregroundColor(.black).fontWeight(.bold))
                        {
                            ForEach(self.listShow.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self)
                            {
                                (index)  in
                                SongsLink(dataComplete: self.$dataComplete, listShow: self.listShow, target: index, isSelected: self.$isSelected, player: self.player, isPlay: self.$isPlay, selectedSong: self.$selectedSong, originalSong: self.$originalSong, favoriteSongs: self.favoriteSongs, listShow_favorite: self.$listShow_favorite)
                            }
                        }
                    }
                    .offset(x:0,y:-geometry.size.width / 9)
                    Path(CGRect(x:0,y:-geometry.size.width * 500 / 414,width: geometry.size.width, height: geometry.size.width * 500 / 414)).fill(nagvigationBarColor1)
                }
            }
            .navigationBarTitle(self.dataComplete == true ? "Songs" : "")
            .navigationBarItems(leading: Button(action:
            {
                self.dataComplete = false
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)}, trailing:
                HStack
                {
                    Spacer()
                    if(self.listShow_favorite.count>0)
                    {
                        Button(action:{self.removeFavoriteAll = true})
                        {
                            Text("Remove Favorite")
                            .foregroundColor(.red)
                        }
                        .alert(isPresented: self.$removeFavoriteAll)
                        {
                            () -> Alert in
                            return Alert(title: Text("Really?!"), message: Text("Are you sure to remove ALL favorite song?"), primaryButton: .default(Text("No!")), secondaryButton: .destructive(Text("Yes!"), action:{
                                for index in 0..<songs.count
                                {
                                    songs[index].isFavorite = false
                                }
                                self.listShow_favorite.removeAll()
                                self.favoriteSongs.favoriteSong.removeAll()
                            }))
                        }
                    }
                    else
                    {
                        Text("Remove Favorite")
                        .foregroundColor(.gray)
                        .hidden()
                    }
                    SearchButton(dataComplete: self.$dataComplete, showSearch: self.$showSearch, searchTerm: self.$searchTerm)
                }
            )
        }
        .onAppear
        {
            if(self.isSelected == true)
            {
                self.isSelected = false
                self.presentationMode.wrappedValue.dismiss()
            }
            else
            {
                self.getSongs()
            }
        }
    }
}

struct MusicList_Previews: PreviewProvider
{
    static var previews: some View
    {
        MusicList(player: AVQueuePlayer(), isPlay: .constant(false), selectedSong: .constant(0), originalSong: .constant(0), favoriteSongs: FavoriteSongs())
    }
}

struct SongsLink: View
{
    @Binding var dataComplete: Bool
    var listShow: [String]
    var target: String
    @State private var index = -1
    @Binding var isSelected: Bool
    var player: AVQueuePlayer
    @Binding var isPlay: Bool
    @Binding var selectedSong: Int
    @Binding var originalSong: Int
    var favoriteSongs: FavoriteSongs
    @Binding var listShow_favorite: [String]
    func findIndex()
    {
        self.index = self.listShow.firstIndex(of: target) ?? -1
        //print("Link:\(songs[index].songName) Favorite:\(songs[index].isFavorite)")
    }
    var body: some View
    {
        ZStack
        {
            if(index > -1)
            {
                NavigationLink(destination: MusicDetail(dataComplete: self.$dataComplete, song: songs[index], isSelected: self.$isSelected, player: self.player, isPlay: self.$isPlay, selectedSong: self.$selectedSong, originalSong: self.$originalSong, choose: index, favoriteSongs: self.favoriteSongs, listShow_favorite: self.$listShow_favorite, listShow: self.listShow))
                {
                    MusicRow(song: songs[index])
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
