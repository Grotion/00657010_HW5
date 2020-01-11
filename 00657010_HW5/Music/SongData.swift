//
//  SongData.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/6.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation

struct SongDetail: Codable, Equatable
{
    var songName: String
    var singer: String?
    var isFavorite: Bool
}

class FavoriteSongs: ObservableObject
{
    @Published var favoriteSong = [SongDetail]()
    {
        didSet
        {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(favoriteSong)
            {
                UserDefaults.standard.set(data, forKey:"favoriteSongs")
            }
        }
    }
    init()
    {
        if let data = UserDefaults.standard.data(forKey: "favoriteSongs")
        {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([SongDetail].self, from:data)
            {
                favoriteSong = decodedData
            }
        }
    }
}

var songs: [SongDetail] =
[
    SongDetail(songName: "Demons", singer: "Imagine Dragons", isFavorite: false),
    SongDetail(songName: "Last Christmas", singer: "Madilyn Bailey", isFavorite: false),
    SongDetail(songName: "Like OOH-AHH", singer: "Twice", isFavorite: false),
    SongDetail(songName: "TT", singer: "Twice", isFavorite: false),
    SongDetail(songName: "Likey", singer: "Twice", isFavorite: false),
    SongDetail(songName: "讓我為你唱情歌", singer: "蕭敬騰", isFavorite: false),
    SongDetail(songName: "你要的全拿走", singer: "胡彥斌", isFavorite: false),
    SongDetail(songName: "光年之外", singer: "鄧紫棋", isFavorite: false),
    SongDetail(songName: "The Nights", singer: "Avicii", isFavorite: false),
    SongDetail(songName: "Wake Me Up", singer: "Avicii", isFavorite: false),
    SongDetail(songName: "Try", singer: "P!nk", isFavorite: false),
    SongDetail(songName: "Best Day Of My Life", singer: "American Authors", isFavorite: false),
    SongDetail(songName: "You Are The Reason", singer: "Calum Scott", isFavorite: false),
    SongDetail(songName: "Something Just Like This", singer: "The Chainsmokers Coldplay", isFavorite: false),
    SongDetail(songName: "Good Luck", singer: "AOA", isFavorite: false),
    SongDetail(songName: "Lost Frequencies", singer: "Reality", isFavorite: false),
    SongDetail(songName: "體面", singer: "于文文", isFavorite: false),
    SongDetail(songName: "New York", singer: "Alicia Keys", isFavorite: false),
    SongDetail(songName: "魚", singer: "怕胖團", isFavorite: false),
    SongDetail(songName: "Girls Like You", singer: "Maroon 5", isFavorite: false),
    SongDetail(songName: "BOOMBAYAH", singer: "BLACKPINK", isFavorite: false)
    
]

var songItems: [AVPlayerItem] =
[
    AVPlayerItem(url:Bundle.main.url(forResource: "\(songs[0].songName)", withExtension: "mp4")!),
]

