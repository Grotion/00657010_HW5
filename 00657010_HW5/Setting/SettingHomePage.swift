//
//  SettingHomePage.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/6.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI
import AVFoundation

struct SettingHomePage: View
{
    init(profilePicData: ProfilePicData, selectImage: Binding<UIImage?>, player: AVQueuePlayer, originalSong: Binding<Int>, isPlay: Binding<Bool>, selectedSong: Binding<Int>, showMusicBar: Binding<Bool>, favoriteSongs: FavoriteSongs)
    {
        UITableView.appearance().backgroundColor = .clear
        self.profilePicData = profilePicData
        self._selectImage = selectImage
        self.player = player
        self._originalSong = originalSong
        self._isPlay = isPlay
        self._selectedSong = selectedSong
        self._showMusicBar = showMusicBar
        self.favoriteSongs = favoriteSongs
    }
    @EnvironmentObject var profileData: ProfileData
    var profilePicData: ProfilePicData
    @Binding var selectImage: UIImage?
    @State private var showLogOutAlert = false
    var player: AVQueuePlayer
    @Binding var isPlay: Bool
    @Binding var selectedSong: Int
    @State private var rateValue = 0
    @State private var showRateAlert = false
    @Binding var originalSong: Int
    @State var looper: AVPlayerLooper?
    @Binding var showMusicBar: Bool
    @State private var volume: CGFloat = 1
    var favoriteSongs: FavoriteSongs
    var body: some View
    {
        GeometryReader
        {
            geometry in
            NavigationView
            {
                ZStack
                {
                    VStack
                    {
                        Form
                        {
                            Section(header: Text("Account").foregroundColor(.black).fontWeight(.bold))
                            {
                                if(self.profileData.profileInfo.isLogIn == true)
                                {
                                    HStack
                                    {
                                        Group
                                        {
                                            if self.selectImage != nil || self.profilePicData.profilePic.count != 0
                                            {
                                                Image(uiImage: UIImage(contentsOfFile: self.profilePicData.profilePic[0].imagePath)!)
                                                .resizable()
                                                .renderingMode(.original)
                                            }
                                            else
                                            {
                                                Image("defaultProfilePic")
                                                .resizable()
                                                .renderingMode(.original)
                                            }
                                        }
                                        .scaledToFill()
                                        .frame(width: geometry.size.width * 60 / 414, height:geometry.size.width * 60 / 414)
                                        .clipShape(Circle())
                                        Text("\(self.profileData.profileInfo.name)")
                                    }
                                    NavigationLink(destination: ProfileEditor(profilePicData: self.profilePicData, selectImage: self.$selectImage, editProfile: self.profileData.profileInfo))
                                    {
                                        Text("Edit")
                                        .foregroundColor(.blue)
                                    }
                                    Button(action:
                                    {
                                        self.showLogOutAlert = true
                                    })
                                    {
                                        Text("Log Out")
                                        .foregroundColor(.red)
                                    }
                                    .alert(isPresented: self.$showLogOutAlert)
                                    {
                                        () -> Alert in
                                        return Alert(title: Text("Really?!"), message: Text("Are you sure to log out?"), primaryButton: .default(Text("No!")), secondaryButton: .destructive(Text("Yes!"), action:{
                                            self.profileData.profileInfo.isLogIn = false
                                            self.profileData.profileInfo.name = ""
                                            self.profileData.profileInfo.selectedGender = 0
                                            self.profileData.profileInfo.age = 20
                                            self.profileData.profileInfo.selectedFavorite = 0
                                            self.profilePicData.profilePic.removeAll()
                                            self.selectImage = nil
                                            print("Log out!")
                                        }))
                                    }
                                }
                                else
                                {
                                    NavigationLink(destination: ProfileEditor(profilePicData: self.profilePicData, selectImage: self.$selectImage))
                                    {
                                        Text("Log In")
                                        .foregroundColor(.blue)
                                    }
                                }
                            }
                            Section(header: Text("Music Settings").foregroundColor(.black).fontWeight(.bold))
                            {
                                Toggle(isOn: self.$showMusicBar)
                                {
                                    Text("Show Music Bar")
                                }
                                HStack
                                {
                                    Text("Music")
                                    Spacer()
                                    HStack
                                    {
                                        if(self.isPlay == true)
                                        {
                                            Text("On")
                                            .fontWeight(.bold)
                                        }
                                        else
                                        {
                                            Text("Off")
                                            .fontWeight(.bold)
                                        }
                                        Button(action:
                                        {
                                            self.isPlay.toggle()
                                            if self.isPlay
                                            {
                                                self.player.play()
                                            }
                                            else
                                            {
                                                self.player.pause()
                                            }
                                        })
                                        {
                                            Image(systemName: self.isPlay ? "speaker.3.fill" : "speaker.slash.fill")
                                            .imageScale(.large)
                                            .foregroundColor(.gray)
                                        }
                                    }
                                }
                                NavigationLink(destination: MusicList(player: self.player, isPlay: self.$isPlay, selectedSong: self.$selectedSong, originalSong: self.$originalSong, favoriteSongs: self.favoriteSongs))
                                {
                                    HStack
                                    {
                                        Text("Playing")
                                        Spacer()
                                        if(self.isPlay)
                                        {
                                            Text("\(songs[self.selectedSong].singer ?? "Unknow") - \(songs[self.selectedSong].songName)")
                                            .foregroundColor(.green)
                                        }
                                        else
                                        {
                                            Text("\(songs[self.selectedSong].singer ?? "Unknow") - \(songs[self.selectedSong].songName)")
                                            .foregroundColor(.gray)
                                        }
                                    }
                                }
                                HStack
                                {
                                    Text("Volume")
                                    Slider(value: self.$volume, in: 0...1, onEditingChanged:
                                    {
                                        (editing) in
                                        //print("Change to :\(self.volume)", editing)
                                        self.player.volume = Float(self.volume)
                                    },minimumValueLabel: Image(systemName: "speaker.fill").imageScale(.small), maximumValueLabel: Image(systemName: "speaker.3.fill").imageScale(.large)){Text("")}
                                }
                            }
                            Section(header: Text("About").foregroundColor(.black).fontWeight(.bold))
                            {
                                HStack
                                {
                                    Text("Application")
                                    Spacer()
                                    Text("Insight Sports")
                                    .fontWeight(.bold)
                                }
                                HStack
                                {
                                    Text("Provider")
                                    Spacer()
                                    Text("Grotion")
                                    .fontWeight(.bold)
                                }
                                HStack
                                {
                                    Text("Category")
                                    Spacer()
                                    Text("Sports")
                                    .fontWeight(.bold)
                                }
                                HStack
                                {
                                    Text("Copyright")
                                    Spacer()
                                    Text("© 2020 GROTION")
                                    .fontWeight(.bold)
                                }
                                HStack
                                {
                                    Text("Current Version")
                                    Spacer()
                                    Text("1.0.0")
                                    .fontWeight(.bold)
                                }
                                HStack
                                {
                                    Text("Last Update")
                                    Spacer()
                                    Text(updates[updates.count-1].date)
                                    .fontWeight(.bold)
                                }
                                NavigationLink(destination: UpdatesList())
                                {
                                    HStack
                                    {
                                        Text("Updates")
                                        Spacer()
                                    }
                                }
                            }
                            Section(header: Text(""))
                            {
                                HStack
                                {
                                    Text("Rate Us")
                                    Spacer()
                                    Group
                                    {
                                        if(self.rateValue<1)
                                        {
                                            Image("noRate")
                                            .resizable()
                                            .renderingMode(.original)
                                        }
                                        else
                                        {
                                            Image("Rate")
                                            .resizable()
                                            .renderingMode(.original)
                                        }
                                    }
                                    .onTapGesture
                                    {
                                        self.rateValue = 1
                                        self.showRateAlert = true
                                    }
                                    .frame(width: geometry.size.width * 20 / 414, height: geometry.size.width * 20 / 414)
                                    .scaledToFit()
                                    .clipped()
                                    Group
                                    {
                                        if(self.rateValue<2)
                                        {
                                            Image("noRate")
                                            .resizable()
                                            .renderingMode(.original)
                                        }
                                        else
                                        {
                                            Image("Rate")
                                            .resizable()
                                            .renderingMode(.original)
                                        }
                                    }
                                    .onTapGesture
                                    {
                                        self.rateValue = 2
                                        self.showRateAlert = true
                                    }
                                    .frame(width: geometry.size.width * 20 / 414, height: geometry.size.width * 20 / 414)
                                    .scaledToFit()
                                    .clipped()
                                    Group
                                    {
                                        if(self.rateValue<3)
                                        {
                                            Image("noRate")
                                            .resizable()
                                            .renderingMode(.original)
                                        }
                                        else
                                        {
                                            Image("Rate")
                                            .resizable()
                                            .renderingMode(.original)
                                        }
                                    }
                                    .onTapGesture
                                    {
                                        self.rateValue = 3
                                        self.showRateAlert = true
                                    }
                                    .frame(width: geometry.size.width * 20 / 414, height: geometry.size.width * 20 / 414)
                                    .scaledToFit()
                                    .clipped()
                                    Group
                                    {
                                        if(self.rateValue<4)
                                        {
                                            Image("noRate")
                                            .resizable()
                                            .renderingMode(.original)
                                        }
                                        else
                                        {
                                            Image("Rate")
                                            .resizable()
                                            .renderingMode(.original)
                                        }
                                    }
                                    .onTapGesture
                                    {
                                        self.rateValue = 4
                                        self.showRateAlert = true
                                    }
                                    .frame(width: geometry.size.width * 20 / 414, height: geometry.size.width * 20 / 414)
                                    .scaledToFit()
                                    .clipped()
                                    Group
                                    {
                                        if(self.rateValue<5)
                                        {
                                            Image("noRate")
                                            .resizable()
                                            .renderingMode(.original)
                                        }
                                        else
                                        {
                                            Image("Rate")
                                            .resizable()
                                            .renderingMode(.original)
                                        }
                                    }
                                    .onTapGesture
                                    {
                                        self.rateValue = 5
                                        self.showRateAlert = true
                                    }
                                    .frame(width: geometry.size.width * 20 / 414, height: geometry.size.width * 20 / 414)
                                    .scaledToFit()
                                    .clipped()
                                    .alert(isPresented: self.$showRateAlert)
                                    {
                                        () -> Alert in
                                        return Alert(title: Text("Thank You!"), message: Text("We have received your respond."))
                                    }
                                }
                            }
                        }
                        if(self.showMusicBar)
                        {
                            Spacer()
                            .frame(height: geometry.size.width / 8)
                        }
                    }
                    Path(CGRect(x:0,y:-geometry.size.width * 500 / 414,width: geometry.size.width, height: geometry.size.width * 500 / 414)).fill(nagvigationBarColor2)
                }
                .navigationBarTitle("Settings")
                .background(Image("settingBackground")
                .resizable()
                .opacity(0.3)
                .frame(width: geometry.size.width)
                .scaledToFit()
                .edgesIgnoringSafeArea(.all))
            }
        }
    }
}

struct SettingHomePage_Previews: PreviewProvider
{
    static var previews: some View
    {
        SettingHomePage(profilePicData: ProfilePicData(), selectImage: .constant(UIImage(named: "pic")), player: AVQueuePlayer(), originalSong: .constant(0), isPlay: .constant(false), selectedSong: .constant(0), showMusicBar: .constant(true), favoriteSongs: FavoriteSongs()).environmentObject(ProfileData())
    }
}
