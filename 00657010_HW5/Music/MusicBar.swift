//
//  MusicBar.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/6.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI
import AVFoundation


struct MusicBar: View
{
    var player: AVQueuePlayer
    @Binding var isPlay: Bool
    @Binding var selectedSong: Int
    @Binding var originalSong: Int
    @State var looper: AVPlayerLooper?
    var unit: CGFloat
    @Binding var showMusicBar: Bool
    var body: some View
    {
        Group
        {
            if self.showMusicBar
            {
                HStack
                {
                    if self.isPlay
                    {
                        Image(systemName: "music.note")
                        .imageScale(.large)
                        .foregroundColor(.white)
                    }
                    else
                    {
                        Image(systemName: "music.note")
                        .imageScale(.large)
                        .foregroundColor(.white)
                        .hidden()
                    }
                    //Text("\(songs[self.selectedSong].singer ?? "Unknow") - \(songs[self.selectedSong].songName)")
                    //Text("\(songs[self.selectedSong].songName)")
                    Text("\(songs[self.selectedSong].songName) - \(songs[self.selectedSong].singer ?? "Unknow")")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    Spacer()
                    Button(action:
                    {
                        if(self.selectedSong - 1 < 0)
                        {
                            self.selectedSong = songs.count - 1
                        }
                        else
                        {
                            self.selectedSong = self.selectedSong - 1
                        }
                        self.player.removeAllItems()
                        self.player.insert(songItems[self.selectedSong], after: nil)
                        self.looper = AVPlayerLooper(player: self.player, templateItem: songItems[self.selectedSong])
                        self.isPlay = true
                        self.player.play()
                        self.originalSong = self.selectedSong
                    })
                    {
                        Image(systemName: "backward.fill")
                        .imageScale(.large)
                        .foregroundColor(.white)
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
                        Image(systemName: isPlay ? "pause.fill" : "play.fill")
                        .imageScale(.large)
                        .foregroundColor(.white)
                        .frame(width: unit * 20, height: unit * 20)
                    }
                    Button(action:
                    {
                        if(self.selectedSong + 1 >= songs.count)
                        {
                            self.selectedSong = 0
                        }
                        else
                        {
                            self.selectedSong = self.selectedSong + 1
                        }
                        self.player.removeAllItems()
                        self.player.insert(songItems[self.selectedSong], after: nil)
                        self.looper = AVPlayerLooper(player: self.player, templateItem: songItems[self.selectedSong])
                        self.isPlay = true
                        self.player.play()
                        self.originalSong = self.selectedSong
                    })
                    {
                        Image(systemName: "forward.fill")
                        .imageScale(.large)
                        .foregroundColor(.white)
                    }
                }
                .padding()
                //.background(Image("snow").resizable(resizingMode: .tile))
                .background(Image("musicBarBackground").resizable(resizingMode: .tile))
                .background(Color.black)
            }
        }
        .onAppear
        {
                self.looper = AVPlayerLooper(player: self.player, templateItem: songItems[0])
        }
    }
}

struct MusicBar_Previews: PreviewProvider
{
    static var previews: some View
    {
        MusicBar(player: AVQueuePlayer(), isPlay: .constant(false), selectedSong: .constant(0), originalSong: .constant(0), unit: 1.0, showMusicBar: .constant(true))
    }
}
