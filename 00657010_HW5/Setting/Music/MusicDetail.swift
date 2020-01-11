//
//  MusicDetail.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/7.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI
import AVFoundation

struct MusicDetail: View
{
    @Environment(\.presentationMode) var presentationMode
    @Binding var dataComplete: Bool
    var song: SongDetail
    @Binding var isSelected: Bool
    var player: AVQueuePlayer
    @Binding var isPlay: Bool
    @Binding var selectedSong: Int
    @Binding var originalSong: Int
    @State var looper: AVPlayerLooper?
    var choose: Int
    @State private var removeFavoriteAlert = false
    @State private var unfindSongAlert = false
    var favoriteSongs: FavoriteSongs
    @Binding var listShow_favorite: [String]
    var listShow: [String]
    @State private var innerFavorite = false
    @State private var currentSongName = ""
    func setIsFavorite()
    {
        self.innerFavorite = songs[self.choose].isFavorite
        let target = "\(songs[self.choose].singer ?? "Unknown") - \(songs[self.choose].songName)"
        self.currentSongName = target
    }
    var body: some View
    {
        GeometryReader
        {
            geometry in
            ZStack
            {
                Image("detailBackground")
                .resizable()
                .opacity(0.3)
                .frame(width: geometry.size.width)
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                VStack
                {
                    Text("\(self.song.songName)")
                    .font(Font.system(size:geometry.size.width * 40 / 414))
                    Text("\(self.song.singer ?? "Unknow")")
                    Button(action:
                    {
                        self.originalSong = self.selectedSong
                        self.selectedSong = self.choose
                        self.player.removeAllItems()
                        self.player.insert(songItems[self.choose], after: nil)
                        self.looper = AVPlayerLooper(player: self.player, templateItem: songItems[self.choose])
                        self.isPlay = true
                        self.player.play()
                        self.isSelected = true
                        self.dataComplete = false
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    {
                        HStack
                        {
                            Text("Paly")
                            .font(Font.system(size:geometry.size.width * 20 / 414))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            Image(systemName: "play")
                        }
                        .foregroundColor(Color.white)
                        .frame(width:geometry.size.width / 2, height:geometry.size.width * 50 / 414)
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.green))
                        .padding(EdgeInsets(top: geometry.size.width * 100 / 414, leading: geometry.size.width * 10 / 414, bottom: geometry.size.width * 20 / 414, trailing: geometry.size.width * 10 / 414))
                    }
                    if(!self.innerFavorite)
                    {
                        Button(action:
                        {
                            songs[self.choose].isFavorite = true
                            self.innerFavorite = true
                            self.favoriteSongs.favoriteSong.append(songs[self.choose])
                            self.listShow_favorite.append(self.currentSongName)
                            sort(self.listShow, &self.listShow_favorite, &self.favoriteSongs.favoriteSong)
                        })
                        {
                            HStack
                            {
                                Text("Add To Favorite")
                                .font(Font.system(size:geometry.size.width * 20 / 414))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                Image(systemName: "star")
                            }
                            .foregroundColor(Color.white)
                            .frame(width:geometry.size.width / 2, height:geometry.size.width * 50 / 414)
                            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.blue))
                            .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: 0, trailing: geometry.size.width * 10 / 414))
                        }
                    }
                    else
                    {
                        Button(action:
                        {
                            self.removeFavoriteAlert = true
                        })
                        {
                            HStack
                            {
                                Text("Remove Frome Favorite")
                                .font(Font.system(size:geometry.size.width * 20 / 414))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                Image(systemName: "star.slash")
                            }
                            .foregroundColor(Color.white)
                            .frame(width:geometry.size.width * 3 / 4, height:geometry.size.width * 60 / 414)
                            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.red))
                            .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: 0, trailing: geometry.size.width * 10 / 414))
                        }
                        .alert(isPresented: self.$removeFavoriteAlert)
                        {
                            () -> Alert in
                            return Alert(title: Text("Really?!"), message: Text("Are you sure to remove from favorite?"), primaryButton: .default(Text("No!")), secondaryButton: .destructive(Text("Yes!"), action:{
                                songs[self.choose].isFavorite = false
                                self.innerFavorite = false
                                //print("Detail Target: \(self.currentSongName)")
                                //print(self.listShow_favorite)
                                let index = self.listShow_favorite.firstIndex(of: self.currentSongName) ?? -1
                                if(index > -1)
                                {
                                    //print("Detai: Found!At: \(index)")
                                    self.favoriteSongs.favoriteSong.remove(at: index)
                                    self.listShow_favorite.remove(at: index)
                                    sort(self.listShow, &self.listShow_favorite, &self.favoriteSongs.favoriteSong)
                                }
                                else
                                {
                                    //print("Detail: not Found!")
                                    self.unfindSongAlert = true
                                }
                            }))
                        }
                    }
                }
            }
            .navigationBarItems(leading: Button(action:
            {
                self.dataComplete = false
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)})
        }
        .onAppear()
        {
            self.setIsFavorite()
        }
    }
}

struct MusicDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        MusicDetail(dataComplete: .constant(true), song: SongDetail(songName: "Demons", singer: "Imagine Dragons", isFavorite: true), isSelected: .constant(false), player: AVQueuePlayer(), isPlay: .constant(false), selectedSong: .constant(0), originalSong: .constant(0), choose: 1, favoriteSongs: FavoriteSongs(), listShow_favorite: .constant(["1"]), listShow: ["1"])
    }
}

func sort(_ allList: [String],_ favoriteList: inout [String], _ data : inout [SongDetail])
{
    var tempList = [String]()
    var tempData = [SongDetail]()
    tempList.removeAll()
    tempData.removeAll()
    for index1 in 0..<allList.count
    {
        let target = allList[index1]
        let index = favoriteList.firstIndex(of: target) ?? -1
        //print("Sort Target:\(target), at: \(index)")
        if(index > -1)
        {
            tempList.append(target)
            tempData.append(data[index])
        }
    }
    favoriteList = tempList
    data = tempData
}
