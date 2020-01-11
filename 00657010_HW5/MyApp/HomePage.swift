//
//  HomePage.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/28.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI
import AVFoundation

struct HomePage: View
{
    let profileData = ProfileData()
    @ObservedObject var profilePicData = ProfilePicData()
    @ObservedObject var favoriteSongs = FavoriteSongs()
    @State var selectImage: UIImage?
    let player = AVQueuePlayer()
    @State private var originalSong = 0
    @State private var isPlay = false
    @State private var selectedSong = 0
    @State private var showMusicBar = true
    var body: some View
    {
        GeometryReader
        {
            geometry in
            TabView
            {
                IntroductionHomePage()
                .tabItem
                {
                    Image(systemName: "info.circle")
                    Text("Intro")
                }
                ProfileHomePage(profilePicData: self.profilePicData, selectImage: self.$selectImage)
                .tabItem
                {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                StatsHomePage(showMusicBar: self.showMusicBar)
                .tabItem
                {
                    Image(systemName: "sportscourt")
                    Text("Stats")
                }
                SettingHomePage(profilePicData: self.profilePicData, selectImage: self.$selectImage, player: self.player, originalSong: self.$originalSong, isPlay: self.$isPlay, selectedSong: self.$selectedSong, showMusicBar: self.$showMusicBar, favoriteSongs: self.favoriteSongs)
                .tabItem
                {
                    Image(systemName: "gear")
                    Text("Setting")
                }
            }
            .overlay(MusicBar(player: self.player, isPlay: self.$isPlay, selectedSong: self.$selectedSong, originalSong: self.$originalSong, unit: geometry.size.width * 1 / 414, showMusicBar: self.$showMusicBar).offset(x: 0, y: -geometry.size.width * 49 / 414), alignment: .bottom)
            /*NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: .main)
            {
                (_) in
                print("Finish Playing!")
            }*/
        }
        .onAppear()
        {
            songItems.removeAll()
            for songsCount in 0..<songs.count
            {
                let item = AVPlayerItem(url:Bundle.main.url(forResource: "\(songs[songsCount].songName)", withExtension: "mp4")!)
                songItems.append(item)
            }
        }
        .environmentObject(profileData)
    }
}

struct HomePage_Previews: PreviewProvider
{
    static var previews: some View
    {
        HomePage().environmentObject(ProfileData())
    }
}
